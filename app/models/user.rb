class User < ApplicationRecord
    has_secure_password
    has_many :items

    has_many :created_reviews, foreign_key: :reviewer_id, class_name: 'Review'
    has_many :reviewed, through: :created_reviews, :source => :reviewee
    
    has_many :recieved_reviews, foreign_key: :reviewee_id, class_name: 'Review'
    has_many :reviewers, through: :recieved_reviews, :source => :reviewer

    has_many :question_answers, through: :items

    has_many :offered_offers, through: :items
    has_many :wanted_offers, through: :items

    def offers
        self.wanted_offers + self.offered_offers
    end

end