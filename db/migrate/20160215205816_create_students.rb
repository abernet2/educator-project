class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :grade, null: false
      t.decimal :gpa, null: false
      t.integer :detentions, null: false
      t.string :gender, null: false
      t.string :snack_food
      t.string :shirt_size
      t.references :teacher
      t.timestamps null: false
    end
  end
end
