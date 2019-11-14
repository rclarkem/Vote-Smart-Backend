class Representative < ApplicationRecord
  # has_many :bills

  def bills
    url = "https://api.propublica.org/congress/v1/members/#{proPublica_id}/bills/introduced.json"
    response = RestClient::Request.execute( method: :get, url: url, headers: {'X-API-Key': ENV['PRO_PUBLICA_API']})
    JSON.parse(response.body)['results'][0]['bills']
  end
end
