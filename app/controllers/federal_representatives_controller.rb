class FederalRepresentativesController < ApplicationController
  def index 
    # render json: RepresentiveService.get_federal_representives('')
    render json: Representative.all
  end
end