class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.timestamp :date
      t.boolean :status
      t.integer :wanted_item
      t.integer :offered_item

      t.timestamps
    end
  end
end
