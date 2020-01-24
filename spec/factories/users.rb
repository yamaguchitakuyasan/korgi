FactoryBot.define do

	factory :user do
		password = Faker::Internet.password(min_length: 8)
		name { "名前" }
		email { Faker::Internet.free_email }
		former_university { "サンプル大学" }
		major { "サンプル学科" }
		password { password }
    	password_confirmation { password }

		after(:create) do |user|
			create_list(:favorite, 3, user: user)
			create_list(:reservation, 3, user: user)
		end
	end
end