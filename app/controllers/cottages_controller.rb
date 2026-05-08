class CottagesController < ApplicationController
  def show
    @cottage = Cottage.find_by!(reference: params[:reference])
    @cottage_details = @cottage.cottage_details
  end
end
