class Studygroup < ActiveRecord::Base

  validates :when, presence: true
  validates :where, presence: true
  validates :duration, presence: true
  validate :validate_time

  has_and_belongs_to_many :users

  geocoded_by :where
  after_validation :calc_geocode

  def strftime
    self.when.strftime("%I:%M %p")
  end

  def calc_geocode

    if self.where.nil?
      return
    end

    unless self.address_ends_with_ca?
      self.update_attribute(:where, self.where << ' CA')
    end

    if !self.previousWhere.nil? && self.where == self.previousWhere
      return
    end

    geo = self.geocode
    if geo.nil? || geo.length == 0
      return
    end

    self.update_attribute(:latitude, geo[0])
    self.update_attribute(:longitude, geo[1])
    self.update_attribute(:previousWhere, self.where)
  end

  def address_ends_with_ca?
    real_regexp = /(california|ca)(,*\s*(united states of america|united states|usa|us))*\s*$/i
    return !(self.where.match (real_regexp)).nil? #it ends in ca or california, or ca, usa (and variations thereof)
  end

  def is_in_future
    time_is_in_future && date_is_in_future
  end

  def time_is_in_future

    if self.when.nil?
      return true
    end

    if Time.zone.now.hour < self.when.hour
      return true
    elsif Time.zone.now.hour == self.when.hour
      return Time.zone.now.min < self.when.min
    end
  end

  def date_is_in_future
    if self.todaysDate.nil?
      return false
    end

    td = self.todaysDate.in_time_zone
    ty = Date.today.in_time_zone - 1
    td > ty
  end

  def validate_time
    errors.add(:when, " must be in future") unless
          self.is_in_future
  end

end
