class AddColumnFileNameToAudios < ActiveRecord::Migration[5.2]
  def change
    add_column :audios, :image, :string
  end
end
