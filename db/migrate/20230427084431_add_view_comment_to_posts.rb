class AddViewCommentToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :view_comments, :boolean, default: true
  end
end
