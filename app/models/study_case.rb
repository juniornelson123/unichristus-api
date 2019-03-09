class StudyCase < ApplicationRecord
  belongs_to :class_room

  has_many :groups
  has_many :words
  has_many :images
  has_many :videos
end
