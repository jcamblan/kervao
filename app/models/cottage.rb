class Cottage < ApplicationRecord
  extend Mobility

  translates :name, :short_description, :full_description

  has_many :cottage_details, -> { order(:position) }, dependent: :destroy, inverse_of: :cottage
  has_many :pricing_rates, dependent: :destroy
  has_one_attached :main_picture
  has_many_attached :photos
  has_many_attached :card_photos

  accepts_nested_attributes_for :cottage_details, allow_destroy: true, reject_if: :all_blank

  validates :reference, presence: true, uniqueness: true, format: { with: /\A[a-z0-9-]+\z/ }

  scope :ordered, -> { order(:position) }
end
