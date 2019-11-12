class FederalRepresentivesController < ApplicationController
  def index 
    #get address
    render json: RepresentiveService.get_federal_representives('')
  end
end
