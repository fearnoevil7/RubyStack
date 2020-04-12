class Course < ApplicationRecord
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :users_that_joined, through: :joins, source: :user
  validates :name, :instructor, presence: true
  validates :capacity, presence: true, numericality: {greater_than: 0}
end
