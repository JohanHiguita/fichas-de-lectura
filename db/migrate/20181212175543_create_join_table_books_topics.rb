class CreateJoinTableBooksTopics < ActiveRecord::Migration[5.2]
  def change
    create_join_table :topics, :books do |t|
      t.references :topic, foreign_key: true
      t.references :book, foreign_key: true
    end
  end
end
