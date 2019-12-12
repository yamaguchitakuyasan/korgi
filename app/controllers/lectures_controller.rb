class LecturesController < ApplicationController

	def index
		@lectures = Lecture.all
	end

	def show
		@lecture = Lecture.find(params[:id])
		@university = @lecture.university
	end

	def update
	end

end
