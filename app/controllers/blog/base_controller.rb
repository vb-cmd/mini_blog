module Blog
  class BaseController < ApplicationController
    layout 'blog/application'

    # before_action :configure_permitted_parameters, if: :devise_controller?

    # private

    # def configure_permitted_parameters
    #   devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar body])
    #   devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar body])
    # end
  end
end
