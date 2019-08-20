class User < ApplicationRecord
    has_many :items

    has_many :reviews_made, foreign_key: :reviewer_id, class_name: 'Review'
    has_many :reviewed, through: :reviews_made, :source => :reviewee
    
    has_many :reviews_recieved, foreign_key: :reviewee_id, class_name: 'Review'
    has_many :reviewers, through: :reviews_recieved, :source => :reviewer

    has_many :question_answers, through: :items

    has_many :offered_offers, through: :items
    has_many :wanted_offers, through: :items

    def offers
        self.wanted_offers + self.offered_offers
    end

end