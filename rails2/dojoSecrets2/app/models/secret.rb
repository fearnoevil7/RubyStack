class Secret < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_that_like, through: :likes, source: :user
  validates :content, presence: true, length: {in: 7..70}
  validates :user, presence: true
end
