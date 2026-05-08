class Pricing < ApplicationRecord
  extend Mobility

  translates :title, :subtitle

  has_many :pricing_periods, -> { order(:position) }, dependent: :destroy, inverse_of: :pricing

  accepts_nested_attributes_for :pricing_periods, allow_destroy: true, reject_if: :all_blank

  def self.instance
    first_or_create!
  end
end
