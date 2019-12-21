class Admin::UniversitiesController < ApplicationController

	before_action :login_required

	def login_required
        redirect_to new_admin_session_path unless current_admin
    end

	def index
		@q = University.ransack(params[:q])
		@universities = @q.result(disinct: true).page(params[:page]).per(10)
		@university = University.new
	end

	def create
		@university = University.new(university_params)
		if
			@university.save
			redirect_to admin_universities_path
		else
			@q = University.ransack(params[:q])
			@universities = @q.result(disinct: true).page(params[:page]).per(10)
			render :index
		end
	end

	def edit
		@university = University.find(params[:id])
	end

	def update
		@university = University.find(params[:id])
		if
			@university.update(university_params)
			redirect_to admin_universities_path
		else
			render :edit
		end
	end

	private
	def university_params
		params.require(:university).permit(:name, :location, :university_image)
	end
end
