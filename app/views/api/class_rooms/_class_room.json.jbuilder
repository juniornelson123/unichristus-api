json.extract! class_room, :id, :name, :description, :user, :study_cases, :created_at, :updated_at
json.students class_room.users do |student|
  json.name student.name
  json.email student.email
  json.created_at student.created_at.strftime("%d/%m/%y")
end

json.url api_class_room_url(class_room, format: :json)
