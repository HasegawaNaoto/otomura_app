class AudioTag < ApplicationRecord
  has_many :audio_tagmaps, dependent: :destroy
  has_many :audios, through: :audio_tagmaps
end
