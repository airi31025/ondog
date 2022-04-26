class ChangeColumnToQuestion < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :question
    remove_column :questions, :answer
  end
end
