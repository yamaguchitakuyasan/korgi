class Admin::UsersController < ApplicationController

	def login_required
        redirect_to new_admin_session_path unless current_admin
    end

	def index
		@q = User.ransack(params[:q])
		@users = @q.result(distict: true).page(params[:page]).per(20)
	end

	def show
	end

	def update
	end

end
