class CreateAudios < ActiveRecord::Migration[5.2]
  def change
    create_table :audios do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :file

      t.timestamps
    end
  end
end
