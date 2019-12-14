class LecturesController < ApplicationController

	def index
		@lectures = Lecture.all
	end

	def show
		@lecture = Lecture.find(params[:id])
		@university = @lecture.university
		@payment = current_user.payment
	end

	def update
	end

end
