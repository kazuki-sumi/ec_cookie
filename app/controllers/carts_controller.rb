class CartsController < ApplicationController

  def index
    @cart = Cart.find_by(user_id: current_user.id, paid: false)
    return "カートは存在しません" unless @cart

    @cart_items = @cart.cart_items
    @products = @cart.products
    @total_price = 0
    @cart_items.zip(@products) {|item, product| @total_price += product.price * item.product_count}
  end

  def create
    raise "この商品は存在しません" unless Product.find_by(id: params[:product_id])

    ActiveRecord::Base.transaction do
      @cart = current_user.carts.create!(paid: false)
      @cart_item = @cart.cart_items.create!(product_count: params[:product_count], product_id: params[:product_id])
    end
    redirect_to carts_path
  end
end
