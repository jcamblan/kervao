class Admin::PricingsController < Admin::BaseController
  def edit
    @pricing = Pricing.instance
    @cottages = Cottage.ordered
    ensure_rates_exist!
  end

  def update
    @pricing = Pricing.instance
    @cottages = Cottage.ordered
    if @pricing.update(pricing_params)
      redirect_to edit_admin_pricing_path, notice: "Tarifs mis à jour"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def ensure_rates_exist!
    @pricing.pricing_periods.each do |period|
      @cottages.each do |cottage|
        unless period.pricing_rates.any? { |r| r.cottage_id == cottage.id }
          period.pricing_rates.build(cottage: cottage, price: 0)
        end
      end
    end
  end

  def pricing_params
    params.require(:pricing).permit(
      :title_fr, :title_en,
      :subtitle_fr, :subtitle_en,
      pricing_periods_attributes: [
        :id, :position, :_destroy,
        :title_fr, :title_en,
        :subtitle_fr, :subtitle_en,
        pricing_rates_attributes: [:id, :cottage_id, :price, :_destroy]
      ]
    )
  end
end
