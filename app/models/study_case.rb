class StudyCase < ApplicationRecord
  belongs_to :class_room
  mount_base64_uploader :image, ImageUploader
  # mount_base64_uploader :video, ImageUploader

  has_many :groups, dependent: :destroy
  has_many :words, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :mind_maps, dependent: :destroy
  has_many :exercises, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :evaluations, dependent: :destroy

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :videos
  accepts_nested_attributes_for :words
  accepts_nested_attributes_for :groups
end
