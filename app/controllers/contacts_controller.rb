class ContactsController < ApplicationController
  def create
    name = params[:name].to_s.strip
    email = params[:email].to_s.strip
    subject = params[:subject].to_s.strip
    message = params[:message].to_s.strip

    if name.present? && email.present? && message.present?
      ContactMailer.new_message(
        name: name,
        email: email,
        subject: subject,
        message: message
      ).deliver_later

      redirect_to home_path(anchor: "contact"),
                  flash: { notice: t("contact.form.success") }
    else
      redirect_to home_path(anchor: "contact"),
                  flash: { alert: t("contact.form.error") }
    end
  end
end
