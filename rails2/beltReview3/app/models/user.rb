class User < ApplicationRecord
  has_secure_password
  has_many :events, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :events_joined, through: :joins, source: :event
  has_many :events_commented_on, through: :comments, source: :event
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :password, presence: true, length: { in: 8..20 }, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
