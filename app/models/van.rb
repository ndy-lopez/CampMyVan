class Van < ApplicationRecord
  validates :brand, presence: true
  validates :model, presence: true
  validates :price, presence: true
end
