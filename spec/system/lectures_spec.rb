require 'rails_helper'

describe 'レクチャー認証のテスト' do
	describe 'レクチャー新規登録' do
		before do
			visit new_admin_session_path
  			fill_in 'admin[email]', with: Faker::Internet.email
  			fill_in 'admin[password]', with: 'password'
  			click_button 'ログイン'
			visit new_admin_lecture_path
	    end
	    context '新規登録画面に遷移' do
	    	it '新規登録に成功する' do
	    		fill_in 'lecture[name]', with: Faker::Internet.username(specifier: 5)
	    		fill_in 'lecture[description]', with: Faker::Lorem.characters(number:20)
	    		fill_in 'lecture[held_at]', with: Faker::Number.between(from: 1, to: 60)
	    		fill_in 'lecture[top_message]', with: Faker::Lorem.characters(number:20)
	    		fill_in 'lecture[required_time]', with: Faker::Date.between_except(from: 30.year.ago, to: Date.today, excepted: Date.today)
	    		click_button '登録'
	    	end

	    	it '新規登録に成功する' do
	    		fill_in 'lecture[name]', with: ''
	    		fill_in 'lecture[description]', ''
	    		fill_in 'lecture[held_at]', with: ''
	    		fill_in 'lecture[top_message]', with: ''
	    		fill_in 'lecture[required_time]', with: ''
	    		click_button '登録'
	    	end
	    end
	end
end