class ProductsController < ApplicationController
  def index
    @product = Product.where(product_category_id: params[:product_category_id])
    @category = ProductCategory.find(params[:product_category_id])
  end

  def show
    render template: "errors/application", layout: false and return unless set_product

    @category = @product.product_category
    @all_product = Product.where(product_category_id: @product.product_category_id)
    @cart = Cart.find_by(user_id: current_user&.id, paid: false)
    @item = CartItem.find_by(product_id: @product.id, cart_id: @cart&.id)
  end

  def new
    @product = Product.new
    @categories = Category.where(path: nil).map { |category| [category.name, category.id] }
    @product_category = @product.product_categories.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      @product.product_categories.create(category_id: params[:product][:category])
      flash[:success] = "成功"
      redirect_to new_product_path
    else
      flash[:alert] = "失敗"
      render :new
    end
  end

  private

    def set_product
      @product = Product.find_by(id: params[:id])
    end

    def product_params
      params.require(:product).permit(:size, :name, :product_description, :price, :product_number)
    end
end
