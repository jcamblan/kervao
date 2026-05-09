class PricingRate < ApplicationRecord
  belongs_to :pricing_period
  belongs_to :cottage

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
