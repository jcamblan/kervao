class Admin::BaseController < ApplicationController
  layout "admin"

  http_basic_authenticate_with(
    name: Rails.application.credentials.dig(:admin, :login) || ENV.fetch("ADMIN_LOGIN", "admin"),
    password: Rails.application.credentials.dig(:admin, :password) || ENV.fetch("ADMIN_PASSWORD", "kervao")
  )

  def default_url_options
    {}
  end
end
