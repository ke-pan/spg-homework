class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :user_id, null: false
      t.integer :friend_id, null: false

      t.timestamps
    end
    add_index :friendships, :user_id
    add_foreign_key :friendships, :users
    add_foreign_key :friendships, :users, column_name: :friend_id
  end
end
