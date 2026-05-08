class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

  around_action :switch_locale

  private

  def switch_locale(&action)
    locale = params[:locale]&.to_sym
    locale = I18n.default_locale unless I18n.available_locales.include?(locale)
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
