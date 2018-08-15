Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "visitors#index"
  resources :user_tests do
    collection do
      get :user_subject_test_report
    end
  end
  resources :attendances do
    collection do
      get :previous_month_dates
      get :next_month_dates
    end
  end
  resources :feeses

  namespace :admin do
    root to: "dashboards#index"
    resources :fees
    resources :branch_classes do
      resources :sections do
        resources :user_fees
        resources :section_subjects do
          resources :section_subject_tests do
            resources :user_tests
          end
        end
        resources :teaching_subjects
        resources :student_sections do
          collection do
            get :section_students
            get :students_permotion
          end
        end
        resources :attendances do 
          collection do
            get :previous_month_dates
            get :next_month_dates
            get :show_attendances
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
