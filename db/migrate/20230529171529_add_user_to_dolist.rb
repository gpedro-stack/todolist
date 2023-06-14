class AddUserToDolist < ActiveRecord::Migration[7.0]
  def change
    add_reference :dolists, :user, null: false, foreign_key: true
  end
end
