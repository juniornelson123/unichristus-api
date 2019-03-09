class StudyCase < ApplicationRecord
  belongs_to :class_room

  has_many :groups
  has_many :words
  has_many :images
  has_many :videos

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :videos
  accepts_nested_attributes_for :words
  accepts_nested_attributes_for :groups
end
