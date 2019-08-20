class Item < ApplicationRecord
  belongs_to :user

  # has_many :offered_items, foreign_key: :offered_item_id, class_name: 'Offer'
  # has_many :offered_offers, through: :offered_items, :source => :offered_item
  has_many :offers_made, foreign_key: :offered_item_id, class_name: 'Offer'
  has_many :offered_to, through: :offers_made, :source => :wanted_item
  

  # has_many :wanted_items, foreign_key: :wanted_item_id, class_name: 'Offer'
  # has_many :wanted_offers, through: :wanted_items, :source => :wanted_item
  has_many :offers_recieved, foreign_key: :wanted_item_id, class_name: 'Offer'
  has_many :offered_items, through: :offers_recieved, :source => :offered_item

end
