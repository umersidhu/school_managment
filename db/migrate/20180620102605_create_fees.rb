class CreateFees < ActiveRecord::Migration[5.1]
  def change
    create_table :fees do |t|
      t.references :branch_class
      t.string :amount

      t.timestamps
    end
  end
end
