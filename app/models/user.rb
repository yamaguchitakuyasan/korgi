class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_one :payment, dependent: :destroy
  has_one :card, dependent: :destroy

  validates :name, presence: true

  attachment :profile_image

end
