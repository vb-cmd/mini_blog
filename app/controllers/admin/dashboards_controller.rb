module Admin
  class DashboardsController < Base
    before_action :authorize_read_action, only: %i[statistics index]

    def index; end

    def statistics; end

    private

    def authorize_read_action
      authorize! :read, params[:action].to_sym
    end
  end
end
