class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  enum role: [:student, :teacher]

  has_many :request_courses
  has_many :comments, dependent: :destroy

  def name
    email
  end
end
