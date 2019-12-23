class Lecture < ApplicationRecord

	has_many :favorites, dependent: :destroy
	has_many :reservations, dependent: :destroy

	belongs_to :university

	validates :name, :top_message, :description, :held_at, :required_time, presence: true
	validates :description,
		length: {maximum: 250}
	validates :top_message,
		length: {maximum: 50}

	attachment :lecture_image

	acts_as_taggable

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
   	end

   	def reserved_by?(user)
   		reservations.where(user_id: user.id).exists?
   	end

end
