class CreateUserFees < ActiveRecord::Migration[5.1]
  def change
    create_table :user_fees do |t|
      t.references :user
      t.references :fee
      t.date :month
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
