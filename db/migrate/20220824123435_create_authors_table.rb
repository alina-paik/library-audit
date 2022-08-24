class CreateAuthorsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
        t.references :users, index: true, foreign_key: true
        t.string :name, null: false, default: ""
        t.timestamps null: false
    end
  end
end
