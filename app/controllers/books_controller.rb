class BooksController < ApplicationController
	before_action :authenticate_user!

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to book_path(@book)
	end

	def index
		@books = Book.all
		@user = current_user
		@book = Book.new
	end

	def show
		@new_book = Book.new
		@book = Book.find(params[:id])
		@user = current_user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
		redirect_to book_path(@book)
	end

	def destroy
		@book = Book.find([:id])
		@book.destroy
		redirect_to '/show'
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
