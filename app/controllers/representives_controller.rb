class RepresentivesController < ApplicationController
  def index 
    response = RestClient::Request.execute(
      method: :get,
      url: 'https://www.googleapis.com/civicinfo/v2/representatives?key=AIzaSyBYsBC3n1WVc0XVmsTkUVTze8KJqzUhM7Y',
      headers: { params: {address: '154 S 3rd Street Brooklyn NY 11211'}})
    bodyJson = JSON.parse(response.body)
    ["kind", "normalizedInput","divisions"].each do |unwantedKey|
      bodyJson.delete(unwantedKey)
    end
    officals = bodyJson["officials"]

    bodyJson["offices"].each do |office|
      office["officialIndices"].each { |index| officals[index.to_i]['title'] = office['name'] }
    end

    render json: officals
  end
end
