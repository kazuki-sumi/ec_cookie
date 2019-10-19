class ProductsController < ApplicationController
  def index
    @product = Product.where(product_category_id: params[:product_category_id])
    @category = ProductCategory.find(params[:product_category_id])
  end

  def show
    raise "この商品は存在しません" unless set_product

    @category = @product.product_category
    @all_product = Product.where(product_category_id: @product.product_category_id)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
  end

  private

    def set_product
      @product = Product.find_by(id: params[:id])
    end

    def product_params
      params.require(:product).permit(:category_id, :name, :contain, :price)
    end
end
