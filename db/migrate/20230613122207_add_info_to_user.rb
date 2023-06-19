class AddInfoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :meta_title, :string
    add_column :users, :meta_description, :string
    add_column :users, :meta_keywords, :string
    add_column :users, :name, :string, null: false
    add_index :users, :name, unique: true
  end
end
