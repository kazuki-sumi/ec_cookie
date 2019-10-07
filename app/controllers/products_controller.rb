class ProductsController < ApplicationController
  def index
    @product = Product.where(product_category_id: params[:product_category_id])
    @category = ProductCategory.find(params[:product_category_id])
  end

  def show
    @product = Product.find(params[:id])
    @category = @product.product_category
    @all_product = Product.where(product_category_id: @product.product_category_id)
  end

  def new
    product = Product.new
  end

  def create
    product = Product.new(product_params)
  end

  private

    def product_params
      params.require(:product).permit(:category_id, :name, :contain, :price)
    end
end
