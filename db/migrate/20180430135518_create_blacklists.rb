class CreateBlacklists < ActiveRecord::Migration[5.2]
  def change
    create_table :blacklists do |t|
      t.integer :user_id, null: false
      t.integer :target_id, null: false

      t.timestamps
    end
    add_index :blacklists, :target_id
    add_foreign_key :blacklists, :users
    add_foreign_key :blacklists, :users, column_name: :target_id
  end
end
