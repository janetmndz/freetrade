class AddTradeColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :trade, :boolean, :default => true
  end
end
