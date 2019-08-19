class CreateQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :question_answers do |t|
      t.string :question
      t.string :answer
      t.belongs_to :item, foreign_key: true

      t.timestamps
    end
  end
end
