class Ninja < ApplicationRecord
  validates :first_name, :last_name, presence: true
  belongs_to :dojo
end
