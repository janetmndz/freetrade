class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :reviwer
      t.text :review

      t.timestamps
    end
  end
end
