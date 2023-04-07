class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords
      
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
