class Van < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :photo

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
