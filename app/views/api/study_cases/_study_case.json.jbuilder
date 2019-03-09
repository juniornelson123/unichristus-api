json.extract! study_case, :id, :title, :description, :class_room_id, :created_at, :updated_at
json.url study_case_url(study_case, format: :json)
