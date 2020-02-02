class CreateAudioTagmaps < ActiveRecord::Migration[5.2]
  def change
    create_table :audio_tagmaps do |t|
      t.references :audio, foreign_key: true
      t.references :audio_tag, foreign_key: true

      t.timestamps
    end
  end
end
