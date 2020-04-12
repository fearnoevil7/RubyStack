class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :user
  validates :comment, presence:true, length: {in:10..100}
  validates :message, :user, presence:true
end
