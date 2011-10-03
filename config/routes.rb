SaasStarter::Application.routes.draw do
  # ActiveAdmin routes
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  # Devise routes
  devise_for :users
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "sign_up", :to => "devise/registrations#new"
    get "sign_out", :to => "devise/sessions#destroy"
  end

  # Site routes
  root :to => "site#home"
  match "/pricing" => "site#pricing"

  # Application root
  match "/:user", :to => "dashboard#show", :as => "app_root"
end
