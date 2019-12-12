class Lecture < ApplicationRecord

	has_many :favorites
	has_many :reservations

	belongs_to :university

	attachment :lecture_image

	acts_as_taggable

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
   	end

   	def reserved_by?(user)
   		reservations.where(user_id: user.id).exists?
   	end

end
