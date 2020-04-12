class Join < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :user, :course, presence: true
end
