class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.integer :subject_id
      t.integer :id_number
      t.string  :name
      t.timestamps
    end
  end
end
