class Pricing < ApplicationRecord
  extend Mobility

  translates :title, :subtitle

  has_many :pricing_periods, -> { order(:position) }, dependent: :destroy, inverse_of: :pricing

  def self.instance
    first_or_create!
  end
end
