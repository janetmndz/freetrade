class Item < ApplicationRecord
  belongs_to :user

  has_many :offers_made, foreign_key: :offered_item_id, class_name: 'Offer'
  has_many :offered_to, through: :offers_made, :source => :wanted_item
  
  has_many :offers_recieved, foreign_key: :wanted_item_id, class_name: 'Offer'
  has_many :offered_items, through: :offers_recieved, :source => :offered_item

end
