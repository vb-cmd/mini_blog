module Admin::BaseHelper
  def humanize_boolean(boolean)
    boolean ? 'Yes' : 'No'
  end

  def model_names_and_paths_for_create
    [
      hash_name_and_path(Category, 'New category', new_admin_category_path),
      hash_name_and_path(Page, 'New page', new_admin_page_path),
      hash_name_and_path(Post, 'New post', new_admin_post_path),
      hash_name_and_path(Comment, 'New comment', new_admin_comment_path),
      hash_name_and_path(User, 'New user', new_admin_user_path)
    ]
  end

  def model_names_and_paths_for_read
    [
      hash_name_and_path(Category, 'All categories', admin_categories_path),
      hash_name_and_path(Page, 'All pages', admin_pages_path),
      hash_name_and_path(Post, 'All posts', admin_posts_path),
      hash_name_and_path(Comment, 'All comments', admin_comments_path),
      hash_name_and_path(User, 'All users', admin_users_path)
    ]
  end

  private

  def hash_name_and_path(name, title, path)
    { name:, title:, path: }
  end
end
