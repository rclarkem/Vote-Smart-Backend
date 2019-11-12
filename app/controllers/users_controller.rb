class UsersController < ApplicationController
  def create
    user = User.find_by(username: user_params[:username])
    if user 
      redirect_to user
    else
      user = User.create(user_params)
      redirect_to user 
    end
  end

  def show
    user = User.find(params[:id])
    if user 
      render json: RepresentiveService.get_federal_representives(user.address)
    end
  end

  private 
  def user_params
    params.require(:user).permit(:username, :address)
  end
end
