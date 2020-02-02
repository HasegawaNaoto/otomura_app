class RemoveCheckedFromNotice < ActiveRecord::Migration[5.2]
  def change
    remove_column :notices, :checked, :boolean
  end
end
