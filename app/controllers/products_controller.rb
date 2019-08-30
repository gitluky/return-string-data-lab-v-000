class ProductsController < ApplicationController
  before_action :set_product, only: [:description, :availability]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render new_product_path
    end
  end

  def description
    binding.pry
    render plain: @product.description
  end

  def availability
    render plain: !!@product.inventory
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

end
