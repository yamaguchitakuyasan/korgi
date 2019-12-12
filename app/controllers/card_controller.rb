class CardController < ApplicationController

	require "payjp"

  def new
  	card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay
  	Payjp.api_key = sk_test_b4e2abe16da21b4ecbb6a9b5
  	if params['payjp-token'].blank?
      redirect_to action: "new"
    else
    	customer = Payjp::Customer.create(
      	card: params['payjp-token'],
     	metadata: {user_id: current_user.id})
      	@card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = sk_test_b4e2abe16da21b4ecbb6a9b5
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show
  	card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = sk_test_b4e2abe16da21b4ecbb6a9b5
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
