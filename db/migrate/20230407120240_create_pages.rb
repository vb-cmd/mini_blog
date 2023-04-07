class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords
      
      t.string :title
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end
