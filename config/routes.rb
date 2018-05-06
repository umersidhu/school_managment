Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "visitors#index"

  namespace :admin do
    root to: "dashboards#index"
    resources :dashboards
    resources :schools
    resources :branches do
      resources :users
    end
  end
end
