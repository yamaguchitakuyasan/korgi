class Admin::LecturesController < ApplicationController

	def index
	end

	def new
		@lecture = Lecture.new
	end

	def create
		lecture = Lecture.new(lecture_params)
		lecture.save
		redirect_to admin_lectures_path
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def lecture_params
		params.require(:lecture).permit(:name, :lecture_image, :top_message, :description, :held_at, :university_id)
	end

end
