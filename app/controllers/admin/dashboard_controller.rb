class Admin::DashboardController < Admin::BaseController
  def index
    @cottages_count = Cottage.count
  end
end
