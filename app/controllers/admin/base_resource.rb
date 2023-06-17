module Admin
  class BaseResource < Base
    load_and_authorize_resource
  end
end
