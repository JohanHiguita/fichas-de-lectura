class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :editorial
      t.string :city

      t.timestamps
    end
  end
end
