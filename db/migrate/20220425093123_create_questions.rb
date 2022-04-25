class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :admin_id
      t.string :title
      t.string :question
      t.string :answer
      t.integer :exp

      t.timestamps
    end
  end
end
