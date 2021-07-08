class BookController < ApplicationController
	def index
		@book = Book.all
	end

	def new
		@book = Book.new
	end

	def create
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
