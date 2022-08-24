class CreateBooksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.references :authors, index: true, foreign_key: true
      t.references :categories, index: true, foreign_key: true
      t.string :name, null: false, default: ""
      t.string :description, null: false, default: ""
      t.string :title_image
      t.timestamps null: false
    end
  end
end
