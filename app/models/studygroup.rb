class Studygroup < ActiveRecord::Base

  validates :when, presence: true
  validates :where, presence: true
  validates :duration, presence: true

  has_and_belongs_to_many :users

  def is_in_future
    time_is_in_future && date_is_in_future
  end

  def time_is_in_future
    if Time.now.hour < self.when.hour
      return true
    elsif Time.now.hour == self.when.hour
      return Time.now.min < self.when.min
    end
  end

  def date_is_in_future
    self.todaysDate > Date.today - 1
    #true
  end

end
