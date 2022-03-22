class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduc)
  end

end
