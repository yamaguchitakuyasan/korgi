require 'rails_helper'

RSpec.describe Favorite, type: :model do
	describe 'アソシエーションのテスト' do
	    context 'Userモデルとの関係' do
	      it 'N:1となっている' do
	        expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
	      end
	    end

	    context 'Lectureモデルとの関係' do
	      it 'N:1となっている' do
	        expect(Favorite.reflect_on_association(:lecture).macro).to eq :belongs_to
	      end
	    end
	end
end
