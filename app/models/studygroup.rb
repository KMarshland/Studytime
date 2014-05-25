class Studygroup < ActiveRecord::Base

  validates :when, presence: true
  validates :where, presence: true
  validates :duration, presence: true

  has_and_belongs_to_many :users

end
