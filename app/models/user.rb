class User < ApplicationRecord
    has_secure_password
    validates :name, :email, :age, :location, presence: true
    validates :email, uniqueness: true
    validate :real_email
    validates :age, numericality: { greater_than: 17, less_than: 110  }

    has_many :items, dependent: :destroy

    has_many :created_reviews, foreign_key: :reviewer_id, class_name: 'Review'
    has_many :reviewed, through: :created_reviews, :source => :reviewee
    
    has_many :recieved_reviews, foreign_key: :reviewee_id, class_name: 'Review'
    has_many :reviewers, through: :recieved_reviews, :source => :reviewer

    has_many :question_answers, through: :items

    has_many :created_offers, through: :items
    has_many :recieved_offers, through: :items
    def real_email
        if !(self.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)
            errors.add(:email, "is not a valid email")
        end
    end

    def offers
        self.created_offers + self.recieved_offers
    end


end