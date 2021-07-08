class BooksController < ApplicationController
	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(params[:id])
		
		if @book.save
			redirect_to books_path
		else
			render new
		end
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
	end

	def update
	end

	def destroy
	end
end