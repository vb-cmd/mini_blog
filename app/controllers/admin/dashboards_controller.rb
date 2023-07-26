module Admin
  class DashboardsController < BaseController
    before_action :authorize_read_action, only: %i[statistics index]

    skip_load_and_authorize_resource

    def index; end

    def statistics; end

    private

    def authorize_read_action
      authorize! :read, params[:action].to_sym
    end
  end
end
