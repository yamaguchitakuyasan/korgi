class UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :login_required

	def login_required
		@user = User.find(params[:id])
		redirect_to new_user_session_path unless @user == current_user
	end

	def show
		@user = current_user
	end

	def edit
		@user = User.find(params[:id])
	if @user != current_user
            redirect_to user_path(current_user)
        end
	end

	def update
		user = User.find(params[:id])
	if user.update(user_params)
		redirect_to user_path
	end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :former_university, :major)
	end

end

