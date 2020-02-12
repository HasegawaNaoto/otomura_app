class RenameSendIdColumnToNotices < ActiveRecord::Migration[5.2]
  def change
    rename_column :notices,:send_id,:user_id
  end
end
