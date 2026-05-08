class PagesController < ApplicationController
  def home
    @home_page = HomePage.instance
    @cottages = Cottage.ordered
    @pricing = Pricing.instance
    @pricing_periods = @pricing.pricing_periods.includes(:pricing_rates)
    @contact_info = ContactInfo.instance
  end
end
