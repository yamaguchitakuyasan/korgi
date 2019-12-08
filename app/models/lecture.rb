class Lecture < ApplicationRecord

	belongs_to :university
	attachment :lecture_image

	acts_as_taggable

end
