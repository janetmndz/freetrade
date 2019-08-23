class RemovingTradeColumnFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :trade
  end
end
