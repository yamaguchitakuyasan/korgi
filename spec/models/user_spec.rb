require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'アソシエーション' do
    it "Favoriteモデルを多数持っている" do
      is_expected.to has_many(:favorites)
    end

    it "Reservationモデルを多数持っている" do
      is_expected.to has_many(:reservations)
    end

    it "Paymentモデルを一つ持っている" do
      is_expected.to has_one(:payment)
    end

    it "Cardモデルを一つ持っている" do
      is_expected.to has_one(:card)
    end
  end

  describe 'バリデーション' do
    it 'name、email、passwordの値が設定されていれば、OK' do
      expect(@user.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it 'passwordが空だとNG' do
    	@user.password =''
    	expect(@user.valid?).to eq(false)
    end
  end
end