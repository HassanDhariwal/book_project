class AuthorsController < ApplicationController

	def index
		@authors =  Author.all
		@count = Book.group("author_id").count
	end

	def new
		@author = Author.new
	end

	def create
		@author = Author.new(author_params)

		if @author.save
			redirect_to authors_path

		else

            puts "============================================ /n #{@author.errors.messages} /n ======================================================="
			redirect_to new
		end
	end

	def show
		@author = Author.find(params[:id])
		@books = @author.books
	end
	
	def edit
		@author = Author.find(params[:id])
	end

	def update
		@author = Author.find(params[:id])
		@author.update(author_params)
		redirect_to authors_path
	end
    
	def destroy
		@author = Author.find(params[:id])
		@author.destroy 
		redirect_to authors_path, :notice =>"author record deleted"
	end



	private
	def author_params
		params.require(:author).permit(:name)
	end

end