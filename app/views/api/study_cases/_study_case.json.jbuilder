json.extract! study_case, :id, :title, :description, :class_room, :groups, :words, :images, :videos, :video, :image, :created_at, :updated_at
json.url api_study_case_url(study_case, format: :json)