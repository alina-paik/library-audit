# frozen_string_literal: true

class CreateBooksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name, null: false, default: ''
      t.string :description, null: false, default: ''
      t.string :title_image
      t.timestamps null: false
    end
  end
end
