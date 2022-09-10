# frozen_string_literal: true

class CreateAuthorsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.references :user, foreign_key: true, null: true
      t.string :name, null: false, default: ''
      t.timestamps null: false
    end
  end
end
