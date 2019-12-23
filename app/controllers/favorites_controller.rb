class FavoritesController < ApplicationController

	def create
		lecture = Lecture.find(params[:lecture_id])
		favorite = current_user.favorites.new(lecture_id: lecture.id)
		favorite.save
		redirect_to lecture_path(lecture.id)
	end

	def destroy
		lecture = Lecture.find(params[:lecture_id])
		favorite = current_user.favorites.find_by(lecture_id: lecture.id)
		favorite.destroy
		redirect_to lecture_path(lecture.id)
	end
end
