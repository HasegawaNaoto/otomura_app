class Audio < ApplicationRecord
  mount_uploader :file, AudioFileUploader
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :audio_tagmaps, dependent: :destroy
  has_many :audio_tags, through: :audio_tagmaps

  def save_audios(audio_tags)
    current_audio_tags = self.audio_tags.pluck(:genre) unless self.audio_tags.nil?
    old_audio_tags = current_audio_tags - audio_tags
    new_audio_tags = audio_tags - current_audio_tags

    # Destroy
    old_audio_tags.each do |old_name|
      self.audio_tags.delete AudioTag.find_by(genre:old_name)
    end

    # Create
    new_audio_tags.each do |new_name|
      audio_tag = AudioTag.find_or_create_by(genre:new_name)
      self.audio_tags << audio_tag
    end
  end
end
