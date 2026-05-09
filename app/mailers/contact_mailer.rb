class ContactMailer < ApplicationMailer
  def new_message(name:, email:, subject:, message:)
    @name = name
    @email = email
    @subject = subject
    @message = message

    recipient = Rails.application.credentials.dig(:contact_email) ||
                ENV["CONTACT_EMAIL"] ||
                ContactInfo.instance.email.presence ||
                "contact@kervao.local"

    mail(
      to: recipient,
      reply_to: email,
      subject: "[Kervao] #{subject_label}: #{name}"
    )
  end

  private

  def subject_label
    case @subject
    when "booking" then I18n.t("contact.form.booking", default: "Réservation")
    when "information" then I18n.t("contact.form.information", default: "Renseignement")
    else @subject.to_s
    end
  end
end
