class AddNotesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :notes, :text
  end
end
