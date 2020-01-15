FactoryBot.define do
	factory :card do
		user_id { Faker::Number.between(from: 1, to: 2) }
		customer_id { Faker::Number.between(from: 1, to: 2)  }
		card_id { Faker::Number.between(from: 1, to: 2)  }
	end
end