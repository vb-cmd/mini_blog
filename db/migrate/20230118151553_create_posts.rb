class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords
      
      t.string :title
      t.text :body
      t.string :description
      t.boolean :published

      t.timestamps
    end
  end
end
