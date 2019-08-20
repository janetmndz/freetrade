class User < ApplicationRecord
    has_many :items

    has_many :reviewers, foreign_key: :reviewer_id, class_name: 'Review'
    has_many :reviewees, through: :reviewers

    has_many :reviewees, foreign_key: :reviewee_id, class_name: 'Review'
    has_many :reviewers, through: :reviewees

    has_many :question_answers, through: :items
    has_many :offers, through: :items
end