class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :body, null: false
      t.boolean :published
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
