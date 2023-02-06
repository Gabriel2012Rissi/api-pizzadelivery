Rails.application.routes.draw do  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    namespace :v1 do
      resources :pizzas, only: [:index, :show]
    end
  end

  root to: "admin/dashboard#index"
end
