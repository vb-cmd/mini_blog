module Blog
  class CategoriesController < BaseController
    def show
      @category = Category.includes(:posts).find(params[:id])
      @posts = @category.posts.where(published: true).page(params[:page])
    end
  end
end
