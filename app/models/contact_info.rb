class ContactInfo < ApplicationRecord
  extend Mobility

  translates :title, :address

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  def self.instance
    first_or_create!
  end
end
