class Hero < ApplicationRecord
    has_many :sidekicks
    validates :name, :superpower, :numPeopleSaved, presence: true
    validates :name, :superpower, length: {minimum: 3}
    validates :numPeopleSaved, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
