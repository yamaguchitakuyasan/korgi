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
		lat_number = params[:lat_number]
		lon_number = params[:lon_number]
		@universities = University.near([lat_number,lon_number], 5, units: :km)
		@lectures = []
		@universities.each do |university|
			@lectures.concat(university.lectures)
		end
		render "index"
	end
end
