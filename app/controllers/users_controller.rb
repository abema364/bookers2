class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # flash[:notice] = "Book was successfully updated."
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end
