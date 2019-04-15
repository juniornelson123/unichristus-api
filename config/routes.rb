Rails.application.routes.draw do
  namespace :api do
    post '/sign_in' => 'sessions#sign_in'
    post '/sign_up' => 'sessions#sign_up'

    resources :users, only: [:index, :show, :update, :destroy]
    resources :words
    resources :groups
    resources :study_cases
    resources :class_rooms
    resources :mind_maps
    resources :steps
    resources :exercises
    resources :evaluations

    get 'study_cases/students/:id' => 'study_cases#get_my_study_cases'

    post 'add_student/class_room' => 'class_rooms#add_student'
    delete 'add_student/class_room/:id' => 'class_rooms#remove_student'

    post 'add_student/group' => 'groups#add_student'
    delete 'add_student/group/:id' => 'groups#remove_student'

    post 'groups/separe_groups/:class_room_id' => 'groups#separe_groups'

    get 'student/mind_map_by/:id' => 'mind_maps#mind_map_by'
    get 'student/get_my_evaluation' => 'evaluations#get_my_evaluation'
    get 'student/get_my_word_by_step' => 'words#get_my_word_by_step'

    get 'student/my_exercises' => 'exercises#my_exercises'
    
    get 'teacher/get_word_by_step' => 'words#get_word_by_step'
    get 'teacher/students' => 'users#students'
    get 'teacher/words/:study_case' => 'words#index_teacher'
  end
end
