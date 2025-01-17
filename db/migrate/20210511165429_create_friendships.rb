class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :user_id, foreign_key: true
      t.integer :friend_id, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
