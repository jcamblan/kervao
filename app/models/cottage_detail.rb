class CottageDetail < ApplicationRecord
  extend Mobility

  translates :title, :description

  belongs_to :cottage

  validates :cottage, presence: true

  default_scope { order(:position) }
end
