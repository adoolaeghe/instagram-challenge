class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  include PublicActivity::Model
  tracked
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



end
