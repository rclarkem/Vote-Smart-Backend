class RepresentativeService  
  def self.get_federal_representatives(address)
    response = RestClient::Request.execute( method: :get, url: @@url, headers: headers('country', address))
    google_civic_reps = JSON.parse(response.body)
    officals = add_title_to_offical(google_civic_reps)
    return officals
  end

  def self.get_local_representatives(address)
    response = RestClient::Request.execute( method: :get, url: @@url, headers: headers('administrativeArea1', address) )
    google_civic_reps = JSON.parse(response.body)
    officals = add_title_to_offical(google_civic_reps)
    return officals
  end

  private
  @@url = "https://www.googleapis.com/civicinfo/v2/representatives?key=#{ENV['GOOGLE_CIVIC']}"
  def self.headers(level, address)
    address = '145 S 3rd Street Brooklyn NY 11211' if address == ''
     {
      params: {
        address: address,
        levels: level
      }
    }
  end

  def self.remove_keys(bodyJson)
    ["kind", "normalizedInput","divisions", "offices"].each do |unwantedKey|
      bodyJson.delete(unwantedKey)
    end
    return bodyJson
  end

  def self.add_title_to_offical(google_civic_reps)
    officals = google_civic_reps["officials"]
    google_civic_reps["offices"].each do |office|
      office["officialIndices"].each { |index| officals[index.to_i]['title'] = office['name'] }
    end
    return officals
  end
end
