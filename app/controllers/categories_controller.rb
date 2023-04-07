class CategoriesController < ApplicationController
  # GET /categories/1
  def show
    @category = Category.includes(:posts).find(params[:id])
    @posts = @category.posts.page(params[:page])
  end
end
