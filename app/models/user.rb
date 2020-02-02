class User < ApplicationRecord
  generate_public_uid

  def to_param
    public_uid
  end

  has_many :prefectures, dependent: :destroy
  has_many :audios, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :genders, dependent: :destroy
  has_many :instruments, dependent: :destroy
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable
  validates :name,{presence:true,length:{maximum:20}}
  validates :content,length:{maximum:200}
  validates :email,{uniqueness:true}
  devise :validatable, password_length: 10..128
  mount_uploader :image, ImageUploader
  mount_uploader :background, BackgroundUploader

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        name: auth.info.name,
        nickname: auth.info.nickname,
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
