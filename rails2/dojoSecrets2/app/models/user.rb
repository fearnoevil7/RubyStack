class User < ApplicationRecord
  has_secure_password
  has_many :secrets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true, length: {in: 2..20}
  validates :password, presence: true, length: {in: 8..20}, on: :create
  validates :email , presence: true, uniqueness: {case_sensitive: false}, format: {with:EMAIL_REGEX}
end
