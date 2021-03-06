class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tips
  has_many :party_challenges
  has_many :answers
  has_many :votes
  mount_uploader :photo, PhotoUploader
end
