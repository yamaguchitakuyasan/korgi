class Admin::UsersController < ApplicationController

	def login_required
        redirect_to new_admin_session_path unless current_admin
    end

	def index
	end

	def show
	end

	def update
	end

end
