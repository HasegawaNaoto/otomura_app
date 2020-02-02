class CreateAudioTags < ActiveRecord::Migration[5.2]
  def change
    create_table :audio_tags do |t|
      t.string :genre

      t.timestamps
    end
  end
end
