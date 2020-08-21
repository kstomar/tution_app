class Course < ApplicationRecord
  validates_presence_of :title

  has_many :request_courses, dependent: :destroy
  has_many :comments, dependent: :destroy
end
