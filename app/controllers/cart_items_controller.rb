class CartItemsController < ApplicationController

  def create
    binding.pry
    raise "この商品は存在しません" unless product = Product.find_by(id: params[:product_id])
    render product_path(product) unless @cart = Cart.find_by(id: params[:cart_id])
    @item = @cart.cart_items.create!(product_id: params[:product_id], product_count: params[:product_count])
    redirect_to carts_path
  end

  def update
    return "この商品は存在しません" unless product = Product.find_by(id: params[:cart_item][:product_id])
    render product_path(product) unless @cart = Cart.find_by(id: params[:cart_id])
    @item = CartItem.find_by(id: params[:id])
    if @item
      @item.update!(product_count: params[:cart_item][:product_count])
      redirect_to carts_path
    else
      render "carts/index"
    end
  end
end
