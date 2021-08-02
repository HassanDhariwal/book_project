class BooksController < ApplicationController
	
	before_action :authenticate_user!, except: [:index]

	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def create

		if params[:author_id].nil?
			author = Author.create(name: params[:book][:writer_name]) 
			
			new_book_params = book_params.merge(author_id: author.id)

		end


		@book = Book.new(new_book_params)
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
		redirect_to books_path,  :notice =>"book record deleted"
	end

	private

	def book_params
		params.require(:book).permit(:name, :price, :author_id)
	end
end
