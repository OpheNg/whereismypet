class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  OPTIONS = ['Found', 'Lost']
  validates_inclusion_of :status, :in => OPTIONS


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
