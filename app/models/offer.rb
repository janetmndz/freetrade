class Offer < ApplicationRecord
    belongs_to :wanted_item, class_name: 'Item'
    belongs_to :offered_item, class_name: 'Item'
end
