class RepresentativesController < ApplicationController
  def index 
    render json: Representative.all
  end
end