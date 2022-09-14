class InviteAuthor < ActiveRecord::Migration[5.2]
  def change
    change_table :authors do |t|
      t.string :invite_token
    end 
  end
end
