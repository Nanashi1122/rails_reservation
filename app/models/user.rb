class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { minimum: 2 }
  has_one_attached :avatar
  validates :avatar, content_type: { in: %w[image/jpeg image/gif image/png], message: "有効なフォーマットではありません", size: { less_than: 5.megabytes, message: "5MBを超える画像はアップロードできません" } }
  include Gravtastic
    gravtastic
      
end
