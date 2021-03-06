class ClassRoom < ApplicationRecord
  paginates_per 10

  has_and_belongs_to_many :users
  
  has_many :study_cases, dependent: :destroy
  has_many :exercices, dependent: :destroy

  belongs_to :user

  accepts_nested_attributes_for :users
end
