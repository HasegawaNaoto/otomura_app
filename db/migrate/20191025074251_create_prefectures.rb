class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.references :user, foreign_key: true
      t.string :area

      t.timestamps
    end
  end
end
