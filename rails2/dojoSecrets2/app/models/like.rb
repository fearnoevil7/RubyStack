class Like < ApplicationRecord
  belongs_to :user
  belongs_to :secret
  validates :user, :secret, presence: true
end
