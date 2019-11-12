class FederalRepresentivesController < ApplicationController
  def index 
    #get address
    # params.permit('')
    render json: RepresentiveService.get_federal_representives('')
  end
end