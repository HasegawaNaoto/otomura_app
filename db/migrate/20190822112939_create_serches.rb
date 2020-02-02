class CreateSerches < ActiveRecord::Migration[5.2]
  def change
    create_table :serches do |t|
      t.text :word
      t.integer :user_id

      t.timestamps
    end
  end
end
