class RepresentativesUserController < ApplicationController
  def create
    req_params = rep_user_params
    repsentative = Representative.find_by(proPublica_id: req_params[:representative_id])
    req_params[:representative_id] = repsentative.id
    added = RepresentativesUser.create(req_params)
    if added 
      render json: added
    end
  end

  private
  def rep_user_params
    params.require(:representatives_user).permit(:user_id, :bill_id, :representative_id, :vote)
  end
end