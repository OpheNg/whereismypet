class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo, dependent: :destroy

  OPTIONS = ['Found', 'Lost']
  validates_inclusion_of :status, :in => OPTIONS

  SEX = ['Female', 'Male']
  validates_inclusion_of :sex, :in => SEX


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
