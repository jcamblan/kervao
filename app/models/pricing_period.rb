class PricingPeriod < ApplicationRecord
  extend Mobility

  translates :title, :subtitle

  belongs_to :pricing
  has_many :pricing_rates, dependent: :destroy, inverse_of: :pricing_period

  accepts_nested_attributes_for :pricing_rates, allow_destroy: true
end
