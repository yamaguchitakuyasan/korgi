FactoryBot.define do

	factory :lecture do
		name { "講義" }
		description { "説明" }
		held_at { Time.now }
		top_message { "トップメッセージ" }
		required_time { Time.now }
		university
	end

	after(:create) do |lecture|
			create_list(:favorite, 1, lecture: lecture)
	end
end