class User < ApplicationRecord
    has_many :items
    has_many :reviews
    has_many :offers, through: :items
end
