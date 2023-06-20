module Admin
  class PagesController < BaseResource
    before_action :set_page, only: %i[show edit update destroy]

    def index
      @pages = Page.all
    end

    def show; end

    def edit; end

    def update
      if @page.update(page_params)
        redirect_to admin_page_path(@page), notice: 'Page was successfully updated.'
      else
        render 'edit', alert: 'Page was not updated.'
      end
    end

    def new
      @page = Page.new
    end

    def create
      @page = Page.new(page_params)

      if @page.save
        redirect_to admin_page_path(@page), notice: 'Page was successfully created.'
      else
        render 'new', alert: 'Page was not created.'
      end
    end

    def destroy
      @page.destroy
      redirect_to admin_pages_path, notice: 'Page was successfully destroyed.'
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
