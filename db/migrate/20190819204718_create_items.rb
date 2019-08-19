class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :condition
      t.string :category
      t.boolean :trade
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
