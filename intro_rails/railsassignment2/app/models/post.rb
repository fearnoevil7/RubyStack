class Post < ApplicationRecord
  belongs_to :blog
  has_many :messages, dependent: :destroy
  validates :title, :content, presence: true
  validates :title, :content, length: {minimum: 7}
end
