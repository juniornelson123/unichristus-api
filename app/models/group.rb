class Group < ApplicationRecord
  paginates_per 10
  
  has_and_belongs_to_many :users

  belongs_to :user
  belongs_to :study_case, optional: true
  belongs_to :class_room

  accepts_nested_attributes_for :users
end
