Rails.application.routes.draw do
  devise_for :teachers
  devise_for :students
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # new routes since addition of courses
  resources :courses, only: [ :index, :show, :new, :create, :update ]  do
    resources :lessons, only: [ :new, :create ]
  end

# old routes
  resources :lessons, only: [ :index, :show, :update ]  do
    resources :attendances, only: [ :create ]
    resources :time_trials, only: [ :create, :show, :update ]
  end
  resources :time_trials, only: [ :index ]

  resources :attendances, only: [ :destroy ] do
    member do
      post 'unattend'
    end
  end
end
