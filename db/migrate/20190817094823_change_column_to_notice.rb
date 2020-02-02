class ChangeColumnToNotice < ActiveRecord::Migration[5.2]
  def change
    def up
  change_column :notices, :checked, :boolean, default:false, null:false
end

def down
  change_column :notices, :checked, :boolean
end
  end
end
