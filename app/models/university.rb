class University < ApplicationRecord

	has_many :lectures, dependent: :destroy
	has_many :professors, dependent: :destroy

	attachment :university_image

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
