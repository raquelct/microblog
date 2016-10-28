class CreateFollowings < ActiveRecord::Migration[5.0]
  def change
    create_table :followings do |t|
      t.references :user, foreign_key: true
      t.references :follower, references: :users, index: true

      t.timestamps
    end

    add_foreign_key :followings, :users, column: :follower_id
    add_index :followings, [:user_id, :follower_id], unique: true
  end
end
