class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :user
      t.references :section
      t.date :attendance_date
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
