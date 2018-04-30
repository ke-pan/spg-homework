class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id, null: false
      t.integer :target_id, null: false

      t.timestamps
    end
    add_index :subscriptions, :target_id
    add_foreign_key :subscriptions, :users
    add_foreign_key :subscriptions, :users, column_name: :target_id
  end
end
