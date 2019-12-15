class LecturesController < ApplicationController

	def index
		@lectures = Lecture.all
	end

	def show
		@lecture = Lecture.find(params[:id])
		@university = @lecture.university
		@payment_created_at = Payment.where(user_id: current_user.id).maximum(:created_at)
	end

	def current_location
		redirect_to action: "index"
	end

end
