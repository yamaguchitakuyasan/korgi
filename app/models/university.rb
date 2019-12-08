class University < ApplicationRecord

	has_many :lectures, dependent: :destroy
	has_many :professors, dependent: :destroy
	attachment :university_image

end
