class AddClumnToPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :user_id, :bigint
    add_column :posts, :user_id, :bigint
  end
end
