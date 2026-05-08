class Admin::ContactInfosController < Admin::BaseController
  def edit
    @contact_info = ContactInfo.instance
  end

  def update
    @contact_info = ContactInfo.instance
    if @contact_info.update(contact_info_params)
      redirect_to edit_admin_contact_info_path, notice: "Infos de contact mises à jour"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def contact_info_params
    params.require(:contact_info).permit(
      :phone_number, :email,
      :title_fr, :title_en,
      :address_fr, :address_en
    )
  end
end
