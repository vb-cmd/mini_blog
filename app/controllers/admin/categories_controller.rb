module Admin
  class CategoriesController < Base
    before_action :set_category, only: %i[edit update destroy]

    def index
      @categories = Category.all
    end

    def edit; end

    def update
      if @category.update(category_params)
        redirect_to category_path(@category)
      else
        redirect_to new_category_path
      end
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to category_path(@category)
      else
        redirect_to new_category_path
      end
    end

    def destroy
      @category.destroy
      redirect_to admin_categories_path
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
