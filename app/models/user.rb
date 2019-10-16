class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :rememberable, :recoverable,
  devise :database_authenticatable, :registerable, :validatable, :timeoutable
  has_many :posts, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_one_attached :profile_pic
  has_many :albums, dependent: :delete_all
end
