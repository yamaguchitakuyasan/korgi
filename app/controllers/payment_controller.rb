class PaymentController < ApplicationController

	require 'payjp'

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = "sk_test_b4e2abe16da21b4ecbb6a9b5"
    Payjp::Charge.create(
    :amount => 10000,
    :customer => card.customer_id,
    :currency => 'jpy',
  	)
    Payment.create(
    :user_id => current_user.id,
    :active => true
   	)
  redirect_to user_path(current_user)
  end

  def update
  	payment = Payment.find(params[:id])
  if payment.active == true
  	payment.update(active: false)
  	redirect_to user_path(current_user)
  else
  	payment.update(active: true)
  	redirect_to user_path(current_user)
  end
  end

end
