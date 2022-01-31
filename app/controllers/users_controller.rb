class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @book = @user.books
    @books = Book.new
  end
  
  def create
    @user = User.new(user_params)
    @user.save
    redirect_to user_path(@user)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user = User.update(user_params)
    redirect_to user_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :user_image)
  end
end
