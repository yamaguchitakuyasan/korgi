FactoryBot.define do
	factory :user do
		password = Faker::Internet.password(min_length: 8)
		name { "名前" }
		email { Faker::Internet.free_email }
		former_university { "サンプル大学" }
		major { "サンプル学科" }
		password { password }
    	password_confirmation { password }
	end
end