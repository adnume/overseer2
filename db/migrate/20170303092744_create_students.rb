class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.integer :subject_id
      t.integer :id_number
      t.string  :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.timestamps
    end
  end
end
