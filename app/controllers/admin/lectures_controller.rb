class Admin::LecturesController < ApplicationController

	def index
		@lectures = Lecture.all
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
		@lecture = Lecture.find(params[:id])
		@university = @lecture.university
	end

	def edit
		@lecture = Lecture.find(params[:id])
	end

	def update
		lecture = Lecture.find(params[:id])
		lecture.update(lecture_params)
		redirect_to admin_lecture_path(lecture.id)
	end

	def destroy
	end

	private
	def lecture_params
		params.require(:lecture).permit(:name, :lecture_image, :top_message, :description, :held_at, :university_id, :tag_list)
	end

end
