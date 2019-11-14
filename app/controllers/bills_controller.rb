class BillsController < ApplicationController
  def user_voted_bills
    user = User.find(params.require('id'))
    bills = user.bills.map do |bill|
      repUser = RepresentativesUser.find_by(bill_id: bill['bill_id'])
      if repUser
        bill = bill.merge({userforBill: repUser.vote})
      end
      bill
    end
    render json: bills
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
