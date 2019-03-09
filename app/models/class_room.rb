class ClassRoom < ApplicationRecord
  
  has_and_belongs_to_many :users
  
  has_many :study_cases

  belongs_to :user


end
