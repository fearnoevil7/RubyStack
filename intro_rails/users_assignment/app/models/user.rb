class User < ApplicationRecord
    validates :first_name, :last_name, :email, :age, presence: true
    validates :first_name, :last_name, :email, length: { minimum: 2 }
    validates :age, numericality:{only_integer: true, greater_than_or_equal_to: 10, less_than: 150}
end
