class AddInfoToAdminUser < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_users, :meta_title, :string
    add_column :admin_users, :meta_description, :string
    add_column :admin_users, :meta_keywords, :string
    add_column :admin_users, :name, :string, null: false
    add_index :admin_users, :name, unique: true
  end
end
