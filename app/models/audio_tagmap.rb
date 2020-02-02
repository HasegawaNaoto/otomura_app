class AudioTagmap < ApplicationRecord
  belongs_to :audio
  belongs_to :audio_tag
end
