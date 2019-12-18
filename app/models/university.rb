class University < ApplicationRecord

	has_many :lectures, dependent: :destroy
	has_many :professors, dependent: :destroy

	validates :name, :location, presence: true

	attachment :university_image

	geocoded_by :location
	after_validation :geocode

	private
	  def geocode
	    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.location.gsub(" ", "")+"&key=AIzaSyAWKdtZHy3XPl9RzmpRzPO3Jhql_tWeIU4")
	    res = HTTP.get(uri).to_s
	    response = JSON.parse(res)
	    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
	    self.longitude = response["results"][0]["geometry"]["location"]["lng"]
	  end

end
