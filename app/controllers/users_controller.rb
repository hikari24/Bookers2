class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  end

  def new
  	@book =  Book.new
 
  end

  def create
  	@book = Book.new(book_params)
	@book.save
	redirect_to book_path(book.id)
  	
  end

  def edit
  	@user = User.find(params[:id])
  end

  private
  
  def user_params
  	params.require(:user).permit(:name, :profile_image)
  end

  def book_params
		params.require(:book).permit(:title, :body)
  end

end
