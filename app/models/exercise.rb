class Exercise < ApplicationRecord
  mount_base64_uploader :file, ImageUploader
  
  belongs_to :class_room
end
