class Offer < ApplicationRecord
  validates :title, :description, presence: true
  validates :price,
    presence: true,
    format: { with: /\A\d+(?:\.\d{0,2})?\z/ },
    numericality: { in: 0..10_000_000 }

  has_one_attached :photo
end
