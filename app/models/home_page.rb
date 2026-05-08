class HomePage < ApplicationRecord
  extend Mobility

  translates :intro, :signature,
             :cottages_title, :cottages_description,
             :find_us_title,
             :where_is_kervao_title, :where_is_kervao_description,
             :where_is_ploudal_title, :where_is_ploudal_description,
             :how_come_title, :how_come_subtitle,
             :by_car, :by_plane, :by_rail

  has_one_attached :top_banner
  has_one_attached :banner2
  has_one_attached :banner3

  def self.instance
    first_or_create!
  end
end
