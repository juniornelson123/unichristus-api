class Image < ApplicationRecord
  mount_base64_uploader :path, ImageUploader

  belongs_to :study_case
end
