class AddFriendIdToNotices < ActiveRecord::Migration[5.2]
  def change
    add_column :notices, :friend_id, :integer
  end
end
