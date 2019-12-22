class Admin::LecturesController < ApplicationController

	before_action :login_required

    def login_required
        redirect_to new_admin_session_path unless current_admin
    end

	def index
		@q = Lecture.ransack(params[:q])
		@lectures = @q.result(distict: true).page(params[:page]).per(10)
	end

	def new
		@lecture = Lecture.new
	end

	def create
		@lecture = Lecture.new(lecture_params)

		if	@lecture.save
			redirect_to admin_lectures_path
		else
			render :new
		end
	end

	def show
		@lecture = Lecture.find(params[:id])
		@reservations = @lecture.reservations
		@university = @lecture.university
	end

	def edit
		@lecture = Lecture.find(params[:id])
	end

	def update
		@lecture = Lecture.find(params[:id])
		if
			@lecture.update(lecture_params)
		   	redirect_to admin_lecture_path(@lecture.id)
		else
		  	render :edit
		end
	end

	def destroy
		@lecture = Lecture.find(params[:id])
		@lecture.destroy
		redirect_to admin_lectures_path
	end

	private
	def lecture_params
		params.require(:lecture).permit(:name, :lecture_image, :top_message, :description, :held_at, :university_id, :tag_list, :required_time)
	end

end
