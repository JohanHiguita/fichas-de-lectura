class CreateCites < ActiveRecord::Migration[5.2]
  def change
    create_table :cites do |t|
      t.text :content
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
