class ProductsController < ApplicationController

def import 
	Product.import(params [:file])
	redirect_to root_url, :notice=> "books imported"
end

end