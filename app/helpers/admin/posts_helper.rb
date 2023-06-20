module Admin::PostsHelper
    def all_categories_name_and_id
        Category.select_title_and_ids
    end
end
