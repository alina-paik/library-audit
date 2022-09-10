# frozen_string_literal: true

class CreateCommentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :value, null: false, default: ''
      t.timestamps null: false
    end
  end
end
