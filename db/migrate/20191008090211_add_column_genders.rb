class AddColumnGenders < ActiveRecord::Migration[5.2]
  def change
    # add_column :genders, :user_id, :integer
    add_column :genders, :gender, :string
  end
end
