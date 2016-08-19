class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.float :outcome
      t.float :target
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
