class Item < ApplicationRecord
  belongs_to :user

  has_many :created_offers, foreign_key: :offered_item_id, class_name: 'Offer', dependent: :destroy
  has_many :created_offers_items, through: :created_offers, :source => :wanted_item
  
  has_many :recieved_offers, foreign_key: :wanted_item_id, class_name: 'Offer', dependent: :destroy
  has_many :recieved_offers_items, through: :recieved_offers, :source => :offered_item

  has_many :question_answers

  validates :name, :description, :condition, :category, :trade, :user_id, presence: true
       

end
