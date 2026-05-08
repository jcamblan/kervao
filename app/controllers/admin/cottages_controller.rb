class Admin::CottagesController < Admin::BaseController
  before_action :set_cottage, only: %i[edit update destroy]

  def index
    @cottages = Cottage.ordered
  end

  def new
    @cottage = Cottage.new
    @cottage.cottage_details.build
  end

  def create
    @cottage = Cottage.new(cottage_params)
    if @cottage.save
      redirect_to admin_cottages_path, notice: "Gîte créé"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @cottage.cottage_details.build if @cottage.cottage_details.empty?
  end

  def update
    if @cottage.update(cottage_params)
      redirect_to admin_cottages_path, notice: "Gîte mis à jour"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cottage.destroy
    redirect_to admin_cottages_path, notice: "Gîte supprimé"
  end

  private

  def set_cottage
    @cottage = Cottage.find(params[:id])
  end

  def cottage_params
    params.require(:cottage).permit(
      :reference, :surface,
      :room_count, :beddings, :washroom_count, :parking_lot_count,
      :disabled_access, :position,
      :main_picture,
      :name_fr, :name_en,
      :short_description_fr, :short_description_en,
      :full_description_fr, :full_description_en,
      photos: [],
      cottage_details_attributes: [
        :id, :position, :_destroy,
        :title_fr, :title_en,
        :description_fr, :description_en
      ]
    )
  end
end
