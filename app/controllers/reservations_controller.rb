class ReservationsController < ApplicationController

	def create
		lecture = Lecture.find(params[:lecture_id])
		reservation = current_user.reservations.new(lecture_id: lecture.id)
		reservation.save
		redirect_to lecture_path(lecture.id)
	end

	def destroy
		lecture = Lecture.find(params[:lecture_id])
		reservation = current_user.reservations.find_by(lecture_id: lecture.id)
		reservation.destroy
		redirect_to lecture_path(lecture.id)
		end
end
