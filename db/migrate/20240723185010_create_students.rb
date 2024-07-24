class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :gender
      t.string :address
      t.string :phone_number
      t.date :admission_date

      t.timestamps
    end
  end
end
