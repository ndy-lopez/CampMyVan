class Van < ApplicationRecord
  has_one_attached :photo
  validates :brand, presence: true
  validates :model, presence: true
  validates :price, presence: true
end
