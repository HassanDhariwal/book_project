class BooksController < ApplicationController
	
	before_action :authenticate_user!, except: [:index]

	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def create
		@book = current_user.books.new(book_params)
		if @book.save
			redirect_to books_path
		else
			redirect_to new
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
		params.require(:book).permit(:name, :price, :user_id)
	end
end
