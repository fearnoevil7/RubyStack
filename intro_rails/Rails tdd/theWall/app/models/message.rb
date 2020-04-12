class Message < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :message, presence:true, length: {in:10..100}
  validates :user, presence:true
end
