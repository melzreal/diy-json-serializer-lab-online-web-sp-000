class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def inventory
      
    product = Product.find(params[:id])
    if product.inventory.nil? 
      render plain: false 
    elsif (!product.inventory.nil? && product.inventory > 0)
      render plain: true
    else
      render plain: false
    end
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def new
    @product = Product.new
  end

   def show
    @product = Product.find(params[:id])
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def data
    product = Product.find(params[:id])
  
    render plain: ProductSerializer.serialize(product)
  end 

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
