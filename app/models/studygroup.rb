class Studygroup < ActiveRecord::Base

  validates :when, presence: true
  validates :where, presence: true
  validates :duration, presence: true
  validate :validate_time

  has_and_belongs_to_many :users

  def is_in_future
    time_is_in_future && date_is_in_future
  end

  def time_is_in_future

    if self.when.nil?
      return false
    end

    if Time.zone.now.hour < self.when.hour
      return true
    elsif Time.zone.now.hour == self.when.hour
      return Time.zone.now.min < self.when.min
    end
  end

  def date_is_in_future
    self.todaysDate > Date.today.in_time_zone - 1
    #true
  end

  def validate_time
    errors.add(:when, " must be in future") unless
          self.is_in_future
  end

end
