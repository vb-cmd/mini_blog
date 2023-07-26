module Admin
  class CategoriesController < BaseController
    before_action :set_category, only: %i[show edit update destroy]

    def index
      @categories = Category.all
    end

    def posts
      @category = Category.find(params[:category_id])
      @posts = @category.posts
    end

    def show; end

    def edit; end

    def update
      if @category.update(category_params)
        redirect_to admin_category_path(@category), notice: 'Category was successfully updated.'
      else
        redirect_to edit_admin_category_path(@category), alert: 'Category was not updated.'
      end
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to admin_category_path(@category), notice: 'Category was successfully created.'
      else
        redirect_to new_admin_category_path, alert: 'Category was not created.'
      end
    end

    def destroy
      @category.destroy
      redirect_to admin_categories_path, notice: 'Category was successfully destroyed.'
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params[:category].permit(:title, :description,
                               :meta_title, :meta_description, :meta_keywords)
    end
  end
end
