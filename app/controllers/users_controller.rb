class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

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
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)
    else
       render 'edit'
    end

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

  def correct_user
      @user = User.find(params[:id])
      redirect_to user_path(current_user) unless @user == current_user
  end

end
