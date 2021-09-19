class Question < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :answers
  scope :recent, -> { order(createc_at: :desc) }
end
