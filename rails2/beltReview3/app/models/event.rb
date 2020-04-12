class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :users_joining, through: :joins, source: :user
  has_many :users_who_commented_on_events, through: :joins, source: :user
  validates :name, :date, :location, :state, presence: true
end