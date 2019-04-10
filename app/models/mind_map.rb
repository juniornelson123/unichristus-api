class MindMap < ApplicationRecord
  mount_base64_uploader :file, ImageUploader

  belongs_to :user
  belongs_to :study_case
end
