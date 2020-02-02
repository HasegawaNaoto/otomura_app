class AddColumnEmoToGenres < ActiveRecord::Migration[5.2]
  def change
      add_column :genres, :emo, :boolean, default:false, null:false
  end
end
