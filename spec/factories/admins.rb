FactoryBot.define do
	factory :admin do
		password = Faker::Internet.password(min_length: 8)
		email { Faker::Internet.free_email }
		password { password }
    	password_confirmation { password }
    end
end