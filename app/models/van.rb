class Van < ApplicationRecord
  has_one_attached :photo

  belongs_to :user

  validates :brand, presence: true
  validates :model, presence: true
  validates :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model

  pg_search_scope :search_by_van,
    against: [:brand, :model, :address],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
