module Admin::BaseHelper
    def humanize_boolean(boolean)
        boolean ? 'Yes' : 'No'
    end
end