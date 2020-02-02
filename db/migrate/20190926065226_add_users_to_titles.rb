class AddUsersToTitles < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :content, :string
    add_column :users, :background, :string
    # add_column :users, :password, :string
  end
end
