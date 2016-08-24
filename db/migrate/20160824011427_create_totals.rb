class CreateTotals < ActiveRecord::Migration
  def change
    create_table :totals do |t|
      t.integer :user_id
      t.date :date
      t.float :total_consumed

      t.timestamps null: false
    end
  end
end
