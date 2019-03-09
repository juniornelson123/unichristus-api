class Group < ApplicationRecord
  has_and_belongs_to_many :users

  belongs_to :user
  belongs_to :study_case
  belongs_to :class_room
end
