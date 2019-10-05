class ProductCategoriesController < ApplicationController
  def index
    @categories = ProductCategory.all
    @products = @categories.map { |category| category.products.where("contain > 1").order(contain: :asc).first }
    @single_price = @categories.map { |category| category.products.where(contain: 1) }
  end
end
