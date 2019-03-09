Rails.application.routes.draw do
  namespace :api do
    post '/sign_in' => 'sessions#sign_in'
    post '/sign_up' => 'sessions#sign_up'

    resources :words
    resources :groups
    resources :study_cases
    resources :class_rooms
  end
end
