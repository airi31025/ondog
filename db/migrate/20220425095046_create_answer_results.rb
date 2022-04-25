class CreateAnswerResults < ActiveRecord::Migration[6.1]
  def change
    create_table :answer_results do |t|
      t.integer :user_id
      t.integer :question_id
      t.boolean :is_correct_answer

      t.timestamps
    end
  end
end
