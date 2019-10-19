class CartsController < ApplicationController
  def create
    raise "この商品は存在しません" unless Product.find_by(id: params[:product_id])

    ActiveRecord::Base.transaction do
      @cart = current_user.carts.create!(paid: false)
      @cart_item = @cart.cart_items.create!(product_count: params[:product_count], product_id: params[:product_id])
    end
    redirect_to carts_path
  end
end
