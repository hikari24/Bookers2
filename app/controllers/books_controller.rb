class BooksController < ApplicationController
	before_action :authenticate_user!

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
		   flash[:notice] = "You have created book successfully."
		   redirect_to book_path(@book)
		else
			@books = Book.all
			@user = current_user
			
			render 'index'

		end
	end

	def index
		@user = current_user
		@book = Book.new
		@books = Book.all
		
	end

	def show
		@new_book = Book.new
		@book = Book.find(params[:id])
		@user = @book.user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
		flash[:notice] = "You have updated book successfully."
		redirect_to book_path(@book)
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		flash[:notice] = "You have destroyed book successfully."
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

	def user_params
  	    params.require(:user).permit(:name, :profile_image, :introduction)
  	end

end
