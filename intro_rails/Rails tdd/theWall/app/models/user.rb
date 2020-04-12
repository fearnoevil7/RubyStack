class User < ApplicationRecord
    has_many :messages
    has_many :comments
    validates :username, presence: true, uniqueness: {case_sensitive: false}, length: { in:5..29}
end
