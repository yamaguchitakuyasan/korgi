class LecturesController < ApplicationController

	def index
		@q = Lecture.ransack(params[:q])
		@location = false
		@lectures =	@q.result(distict: true).page(params[:page]).per(10)
	end

	def show
		@lecture = Lecture.find(params[:id])
		@university = @lecture.university
	if user_signed_in?
		@payment = Payment.where(user_id: current_user.id)
		@payment_created_at = Payment.where(user_id: current_user.id).maximum(:created_at)
	end
	end

	def current_location
		lat_number = params[:lat_number]
		lon_number = params[:lon_number]
		@universities = University.near([lat_number,lon_number], 5, units: :km)
		@lectures = []
		@universities.each do |university|
			@lectures.concat(university.lectures)
		end
		@location = true
		@q = Lecture.ransack()
		render "index"
	end
end
