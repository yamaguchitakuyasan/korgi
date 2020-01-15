require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @card = build(:card)
  end

  describe 'バリデーション' do
    it 'user_id,customer_id,card_idの値が設定されていれば、OK' do
      expect(@card.valid?).to eq(true)
    end

    it 'user_idが空だとNG' do
      @card.user_id = ''
      expect(@card.valid?).to eq(false)
    end

    it 'customer_idが空だとNG' do
      @card.customer_id = ''
      expect(@card.valid?).to eq(false)
    end

    it 'cardが空だとNG' do
    	@card.card_id = ''
    	expect(@card.valid?).to eq(false)
    end
  end
end