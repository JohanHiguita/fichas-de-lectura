class CreateAutors < ActiveRecord::Migration[5.2]
  def change
    create_table :autors do |t|
      t.string :name1
      t.string :name2
      t.string :lastname1
      t.string :lastname2

      t.timestamps
    end
  end
end
