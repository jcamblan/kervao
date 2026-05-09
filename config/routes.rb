Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: redirect("/fr")

  scope ":locale", locale: /fr|en/ do
    get "/", to: "pages#home", as: :home
    get "/gites/:reference", to: "cottages#show", as: :cottage
    post "/contact", to: "contacts#create", as: :contact
  end

  namespace :admin do
    root to: "dashboard#index"

    resource :home_page, only: %i[edit update]
    resource :contact_info, only: %i[edit update]
    resource :pricing, only: %i[edit update]
    resources :cottages
  end
end
