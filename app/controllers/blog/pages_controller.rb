module Blog
  class PagesController < BaseController
    def show
      @page = Page.find(params[:id])
    end
  end
end
