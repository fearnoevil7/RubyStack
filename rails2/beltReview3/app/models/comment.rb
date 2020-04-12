class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :content, presence: true, length: {in: 7..100}
  validates :user, :event, presence: true
end
