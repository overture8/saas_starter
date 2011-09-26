SaasStarter::Application.routes.draw do
  # ActiveAdmin routes
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  # Devise routes
  devise_for :users
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "sign_up", :to => "devise/registrations#new"
  end

  # Site routes
  root :to => "site#home"
  match "/pricing" => "site#pricing"
end
