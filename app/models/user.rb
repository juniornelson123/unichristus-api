class User < ApplicationRecord
  paginates_per 10
  
  enum role: { student: 0, teacher: 1, groups: 2}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :class_rooms, dependent: :destroy
  has_and_belongs_to_many :groups    
  
  has_many :my_class_rooms, foreign_key: "user_id", class_name: "ClassRoom"
  has_many :words
  
  has_one :group

  accepts_nested_attributes_for :words
  accepts_nested_attributes_for :class_rooms
  accepts_nested_attributes_for :groups
  accepts_nested_attributes_for :my_class_rooms
end
