class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.integer :send_id
      t.integer :visited_id
      t.integer :comment_id
      t.integer :like_id
      t.boolean :checked

      t.timestamps
    end
  end
end
