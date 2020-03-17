class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
    @books = @user.books
  end

  def new
  	@book =  Book.new

  end

  def create

  	
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  end

  def index 
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  private

  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
		params.require(:book).permit(:title, :body)
  end

end
