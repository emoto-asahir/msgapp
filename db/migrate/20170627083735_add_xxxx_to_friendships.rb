class AddXxxxToFriendships < ActiveRecord::Migration[5.0]
  def change
    add_column :friendships, :uname, :string
  end
end
