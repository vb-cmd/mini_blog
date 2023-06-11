module Admin
  class PagesController < Base
    before_action :set_page, only: %i[edit update destroy]

    def edit; end

    def update
      if @page.update(page_params)
        redirect_to page_path(@page)
      else
        redirect_to new_page_path
      end
    end

    def new
      @page = Page.new
    end

    def create
      @page = Page.new(page_params)

      if @page.save
        redirect_to page_path(@page)
      else
        redirect_to new_page_path
      end
    end

    def destroy
      @page.destroy
    end

    private

    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params[:page].permit(:title, :body, :published,
                           :meta_title, :meta_description, :meta_keywords)
    end
  end
end
