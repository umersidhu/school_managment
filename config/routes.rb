Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "visitors#index"

  namespace :admin do
    root to: "dashboards#index"
    resources :branch_classes do
      resources :sections do
        resources :teaching_subjects
        resources :student_sections do
          collection do
            get :section_students
          end
        end
      end
      resources :subjects 
    end
    resources :dashboards
    resources :schools
    resources :users, only: [:index]
    resources :branches do
      resources :users
    end
    resources :students
    resources :teachers
  end
end
