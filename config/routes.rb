Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "admin/dashboards#index"

  namespace :admin do
    root to: "dashboards#index"
    resources :dashboards
    resources :schools
    resources :branches do
      resources :branch_owner
    end
  end
end
