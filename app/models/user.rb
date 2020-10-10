class User < ApplicationRecord
   validates :name, presence: true, length: {maximum: 15}
   validates :email,presence: true
   #validates :password,presence: true, length: {minimum: 8, maximum: 32}
   #validates :password,format: { with: /\A[a-zA-Z0-9]+\z/}
   #validates :email,format: { with: /A\S+@\S+\.\S+z/}
   mount_uploader :image, ImageUploader

   has_secure_password
   has_many :topics, dependent: :destroy
   has_many :favorites, dependent: :destroy
   has_many :favorite_topics, through: :favorites, source: 'topic'
   has_many :comments, dependent: :destroy
end
