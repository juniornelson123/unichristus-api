Rails.application.routes.draw do
  namespace :api do
    post '/sign_in' => 'sessions#sign_in'
    post '/sign_up' => 'sessions#sign_up'

    resources :users, only: [:index, :show, :update, :destroy]
    resources :words
    resources :groups
    resources :study_cases
    resources :class_rooms

    post 'add_student/class_room' => 'class_rooms#add_student'
    delete 'add_student/class_room/:id' => 'class_rooms#remove_student'

    post 'add_student/group' => 'groups#add_student'
    delete 'add_student/group/:id' => 'groups#remove_student'

    get 'teacher/students' => 'users#students'
  end
end
