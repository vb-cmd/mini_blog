module Admin::CommentsHelper
  def all_posts_title_and_id
    Post.select_title_and_ids
  end

  def all_users_name_and_id
    User.select_name_and_ids
  end
end
