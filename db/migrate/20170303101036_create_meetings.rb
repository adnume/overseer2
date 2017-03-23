class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.integer :subject_id
      t.string :meeting_type, default: "Regular"
      t.date :date
      t.time :start_time
      t.time :end_time
      t.text :remarks
      t.timestamps
    end
  end
end
