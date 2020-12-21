class User < ApplicationRecord
    has_many :favoritelists
    has_many :wishlists
    validates :username, :name, presence: true
    validates :username, uniqueness: true
end
