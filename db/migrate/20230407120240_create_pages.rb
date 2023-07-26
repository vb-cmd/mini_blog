class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      # meta info
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords

      # page info
      t.string :title
      t.boolean :published, default: true

      t.timestamps
    end
  end
end
