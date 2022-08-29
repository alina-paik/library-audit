class BooksCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :books_categories do |t|
      t.references :books, index: true, foreign_key: true
      t.references :categories, index: true, foreign_key: true
    end 
  end
end
