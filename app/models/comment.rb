class Comment < ApplicationRecord
  validates :content,{presence: true,length:{maximum:200}}
  mount_uploaders :images, ImageUploader
end
