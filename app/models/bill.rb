class Bill
  attr_reader :bill
  
  def initialize(bill_id)
    id = bill_id.split('-')[0]
    url = "https://api.propublica.org/congress/v1/116/bills/#{id}.json"
    response = RestClient::Request.execute( method: :get, url: url, headers: {'X-API-Key': ENV['PRO_PUBLICA_API']})
    @bill = JSON.parse(response.body)['results'][0]
  end
end