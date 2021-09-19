class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_one_attached :image
  has_many :questions
  has_many :answers
end
