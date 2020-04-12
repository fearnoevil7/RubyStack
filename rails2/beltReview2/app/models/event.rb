class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :users_that_commented, through: :comments, source: :user
  has_many :users_that_joined, through: :joins, source: :user
  validates :name, :date, :location, :state, presence: true
end
