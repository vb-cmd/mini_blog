class CategoriesController < ApplicationController
  def show
    @category = Category.includes(:posts).find(params[:id])
    @posts = @category.posts.page(params[:page])
  end
end
