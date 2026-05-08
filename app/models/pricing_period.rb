class PricingPeriod < ApplicationRecord
  extend Mobility

  translates :title, :subtitle

  belongs_to :pricing
  has_many :pricing_rates, dependent: :destroy, inverse_of: :pricing_period
end
