require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'アソシエーションのテスト' do
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'Reservationsモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:reservations).macro).to eq :has_many
      end
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