class AddCount < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :comments_count, :integer, default: 0
    add_column :users, :comments_count, :integer, default: 0
    add_column :users, :likes_count, :integer, default: 0
    add_column :admin_users, :posts_count, :integer, default: 0
    add_column :admin_users, :pages_count, :integer, default: 0
    add_column :categories, :posts_count, :integer, default: 0
  end
end
