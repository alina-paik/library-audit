class AuthorsBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :authors_books do |t|
      t.references :books, index: true, foreign_key: true
      t.references :authors, index: true, foreign_key: true
    end
  end
end
