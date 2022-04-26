class CreateQuestionContent < ActiveRecord::Migration[6.1]
  def change
    create_table :question_contents do |t|
      t.references :question
      t.string :content
      t.string :answer
      t.timestamps
    end
  end
end
