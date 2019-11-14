class BillsController < ApplicationController
  def user_voted_bills
    user = User.find(params.require('id'))
    render json: user.bills
  end

  def show
    url = "https://api.propublica.org/congress/v1/members/#{representive_id}/bills/introduced.json"
    response = RestClient::Request.execute( method: :get, url: url, headers: {'X-API-Key': ENV['PRO_PUBLICA_API']})
    bills = JSON.parse(response.body)['results'][0]['bills']
    render json: bills
  end

  private 
  def representive_id 
    params.require('id')
  end
end
