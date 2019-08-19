class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.timestamp :date
      t.boolean :status
      t.integer :wanted_item_id
      t.integer :offered_item_id

      t.timestamps
    end

    add_foreign_key :offers, :items, column: :wanted_item_id
    add_index :offers, :wanted_item_id

    add_foreign_key :offers, :items, column: :offered_item_id
    add_index :offers, :offered_item_id
  end
end
