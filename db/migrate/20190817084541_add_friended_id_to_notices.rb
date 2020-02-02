class AddFriendedIdToNotices < ActiveRecord::Migration[5.2]
  def change
    add_column :notices, :friended_id, :integer
  end
end
