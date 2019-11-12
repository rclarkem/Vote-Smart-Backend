class BillsController < ApplicationController
  def index 
    render json: BillService.new.get_members()
    #get address
    # byebug
    # representive_id
    # render json: RepresentiveService.get_local_representives(''/)
  end
  private 
  def representive_id 
    params.require('federal_representive_id')
  end
end
