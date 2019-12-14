class UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :login_required

	def login_required
		@user = User.find(params[:id])
		redirect_to new_user_session_path unless @user == current_user
	end

	def show
		@user = current_user
		@payment_created_at = Payment.where(user_id: current_user.id).maximum(:created_at)
		@payment = @user.payment
		@card = @user.card
	if @card.present?
		card = Card.where(user_id: current_user.id).first
		Payjp.api_key = "sk_test_b4e2abe16da21b4ecbb6a9b5"
  		customer = Payjp::Customer.retrieve(card.customer_id)
  		@default_card_information = customer.cards.retrieve(card.card_id)
  	end
	end

	def edit
		@user = User.find(params[:id])
	if  @user != current_user
        redirect_to user_path(current_user)
        end
	end

	def update
		user = User.find(params[:id])
	if  user.update(user_params)
		redirect_to user_path
	end
	end

	def mykorgi
		@user = current_user
		@reservations = @user.reservations
		@favorites = @user.favorites
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :former_university, :major, :profile_image)
	end

end

