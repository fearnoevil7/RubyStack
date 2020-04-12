class User < ApplicationRecord
  has_secure_password
  has_many :courses, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :courses_joined, through: :joins, source: :course
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true
  validates :password, presence: true, length: {in: 8..25}
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
end

<p>Here are the organizations you may join:</p>
        <% @groups.each do |group| %>
        <h3><%= @group.name %></h3>
        <p>Members: </p>
        <p><%= @group.description %></p>
        <% end %>