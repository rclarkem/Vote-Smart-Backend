class BillService
  attr_reader :url
  def initialize
    @url = 'https://api.propublica.org/congress/v1/116/senate/members.json'
  end

  def get_members
    members_response = make_request()
    # me
  end

  private 
  def make_request() 
    response = RestClient::Request.execute(
      method: :get, 
      url: @url, 
      headers: {'X-API-Key': ENV['PRO_PUBLICA_API']})
    JSON.parse(response.body)
  end
end