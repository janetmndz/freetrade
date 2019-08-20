class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :reviewee_id
      t.integer :reviewer_id
      t.text :review

      t.timestamps
    end
    
    add_foreign_key :reviews, :users, column: :reviewee_id
    add_index :reviews, :reviewee_id

    add_foreign_key :reviews, :users, column: :reviewer_id
    add_index :reviews, :reviewer_id
  end
end
