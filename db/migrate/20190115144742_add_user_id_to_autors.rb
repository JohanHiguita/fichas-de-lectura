class AddUserIdToAutors < ActiveRecord::Migration[5.2]
  def change
    add_reference :autors, :user, foreign_key: true
  end
end
