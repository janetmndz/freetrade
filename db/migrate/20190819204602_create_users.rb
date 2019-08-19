class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :location
      t.text :bio

      t.timestamps
    end
  end
end
