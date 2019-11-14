class RepresentativesController < ApplicationController
  def index 
    render json: Representative.all
  end

  def show
    rep = Representative.find_by(proPublica_id: representive_id)
    bills = rep.bills.map do |bill|
      repUser = RepresentativesUser.find_by(bill_id: bill['bill_id'])
      if repUser
        bill = bill.merge({userforBill: repUser.vote})
      end
      bill
    end
    render json: bills
  end

  private 
  def representive_id 
    params.require('id')
  end
end