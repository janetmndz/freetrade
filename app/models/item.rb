class Item < ApplicationRecord
  belongs_to :user

  has_many :offered_items, foreign_key: :offered_item_id, class_name: 'Item'
  has_many :wanted_items, through: :offered_items

  has_many :wanted_items, foreign_key: :wanted_item_id, class_name: 'Item'
  has_many :offered_items, through: :wanted_items

  has_many :question_answers
end
