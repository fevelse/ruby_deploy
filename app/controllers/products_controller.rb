class ProductsController < ApplicationController
	before_action :get_product, except: [:index, :new, :create]
	
	def index
		@products = Product.all
	end
	
	def new
		@product = Product.new
	end
	def create
		@product =Product.create(product_params)
		if @product.errors.any?
			render :new,
			flash: {errors: @product.errors.full_messages}			
		else
			redirect_to products_path
		end
	end
	
	def show
		#Show method calls the private get_product method which provides the product needed.
		render :show
	end
	
	def edit
		#edit method calls the private get_product method which provides the product needed.
		render :edit
	end
	
	def update
		@product.update(product_params)
		if @product.errors.any?
			redirect_to edit_product_path(@product),
			flash:{errors: @product.errors.full_messages}
			
		end
			redirect_to product_path(@product)
	end
	def destroy
		@product.destroy
		if @product.errors.any?
			redirect_to products_path,
			flash: {errors: @product.errors.full_messages}			
		else
			redirect_to products_path
		end
	end
	
	private
	
	def product_params
		params.require(:product).permit(:name, :description, :price)
	end
	#the get_product method is done before show and edit and is called by before_action
	def get_product
		@product = Product.find(params[:id])
	end
end
