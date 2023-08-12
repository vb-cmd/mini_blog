class AddInfoToAdminUser < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_users, :name, :string, null: false
    add_column :admin_users, :body, :text
    add_index :admin_users, :name, unique: true
  end
end
