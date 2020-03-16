class CategoriesController < ApplicationController
  # 後々ちゃんと修正
  def index
    @categories = ProductCategory.all
    @products = @categories.map { |category| category.products.where("contain > 1").order(contain: :asc).first }
    @single_price = @categories.map { |category| category.products.where(contain: 1) }
  end

  def new
    @category = Category.new
    categories = Category.all
    @large_categories = categories.map { |category| [category.name, category.id] if category.path.nil? }
    @medium_categories = categories.map { |category| [category.name, "#{category.path}/#{category.id}"] unless category.path&.include?("/") || category.path.nil? }
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "成功"
      redirect_to new_category_path
    else
      flash[:alert] = "失敗"
      render :new
    end
  end

  private

    def category_params
      params.require(:category).permit(:name, :category_summary, :path)
    end
end
