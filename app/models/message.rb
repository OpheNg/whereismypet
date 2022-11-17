class Message < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  has_one_attached :attachment,  dependent: :destroy

  validates :content, length: { maximum: 100 }
end
