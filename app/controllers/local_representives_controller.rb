class LocalRepresentivesController < ApplicationController
  def index 
    #get address
    render json: RepresentiveService.get_local_representives('')
  end
end
