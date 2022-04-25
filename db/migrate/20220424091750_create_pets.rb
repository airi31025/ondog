class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.integer :user_
      t.string :name
      t.integer :level,default: 1
      t.integer :exp,default: 0
      t.integer :threshold

      t.timestamps
    end
  end
end
