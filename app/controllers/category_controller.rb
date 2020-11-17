class CategoryController < ApplicationController
  def index
    @categories = Category.order(:name)
  end

  def show
    @category = Category.find(params[:id])
    # @category = Category.where(category_id: @category_id)
  end
end
