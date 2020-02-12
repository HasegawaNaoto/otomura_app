class Post < ApplicationRecord
  belongs_to :user
  validates :content,{presence: true,length:{maximum:200}}
  mount_uploaders :images, ImageUploader
  mount_uploader :video, VideoUploader
  validate  :video_size

  private
  def video_size
    if video.size > 100.megabytes
      errors.add(:video,"should be less than 100MB")
    end
  end
end
