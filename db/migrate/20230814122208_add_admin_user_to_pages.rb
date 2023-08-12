class AddAdminUserToPages < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :pages, :admin_user, foreign_key: true
  end
end
