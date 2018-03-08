class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # these are attributes that are given to a user when they sign up. 

  has_many :tweets

  mount_uploader :avatar, AvatarUploader

  validates :username, presence: true
  # these validations are a boolean. there must be a username and it must be unique to function. 
  validates :username, uniqueness: true
  serialize :following, Array
  
end
