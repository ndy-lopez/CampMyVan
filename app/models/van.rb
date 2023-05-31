class Van < ApplicationRecord
  has_one_attached :photo
  validates :brand, presence: true
  validates :model, presence: true
  validates :price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
