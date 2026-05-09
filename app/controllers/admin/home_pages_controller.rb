class Admin::HomePagesController < Admin::BaseController
  def edit
    @home_page = HomePage.instance
  end

  def update
    @home_page = HomePage.instance
    if @home_page.update(home_page_params)
      redirect_to edit_admin_home_page_path, notice: "Page d'accueil mise à jour"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def home_page_params
    params.require(:home_page).permit(
      :top_banner, :banner2, :banner3,
      :intro_fr, :intro_en,
      :signature_fr, :signature_en,
      :marquee_words_fr, :marquee_words_en,
      :find_us_title_fr, :find_us_title_en,
      :where_is_kervao_title_fr, :where_is_kervao_title_en,
      :where_is_kervao_description_fr, :where_is_kervao_description_en,
      :where_is_ploudal_title_fr, :where_is_ploudal_title_en,
      :where_is_ploudal_description_fr, :where_is_ploudal_description_en,
      :how_come_title_fr, :how_come_title_en,
      :how_come_subtitle_fr, :how_come_subtitle_en,
      :by_car_fr, :by_car_en,
      :by_plane_fr, :by_plane_en,
      :by_rail_fr, :by_rail_en
    )
  end
end
