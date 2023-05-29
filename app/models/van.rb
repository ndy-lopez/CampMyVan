class Van < ApplicationRecord
  validates :type, presence: true
  validates :model, presence: true
  validates :price, presence: true
end
