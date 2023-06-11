class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      # meta info
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords
      
      # post info
      t.string :title
      t.text :body
      t.text :description
      t.boolean :published, default: true
      t.boolean :comments_enabled, default: false
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
