class BooksController < ApplicationController
	before_action :authenticate_user!

	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
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
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
		redirect_to books_path
	end
    
	def destroy
		@book = Book.find(params[:id])
		 @book.destroy 
		#flash[:notice] = "book record deleted" 
		redirect_to books_path,  :notice =>"book record deleted"
	end

	private

	def book_params
		params.require(:book).permit(:name, :price, :writer_name)
	end
end
