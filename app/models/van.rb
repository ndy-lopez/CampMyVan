class Van < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  validates :brand, presence: true
  validates :model, presence: true
  validates :price, presence: true
end
