class Admin::UniversitiesController < ApplicationController
	def index
		@universities = University.all
		@university = University.new
	end

	def create
		university = University.new(university_params)
		university.save
		redirect_to admin_universities_path
	end

	def edit
		@university = University.find(params[:id])
	end

	def update
		university = University.find(params[:id])
		university.update(university_params)
		redirect_to admin_universities_path
	end

	private
	def university_params
		params.require(:university).permit(:name, :location)
	end
end
