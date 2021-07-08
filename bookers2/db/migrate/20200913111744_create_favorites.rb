class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :book_id
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
      t.index [:user_id, :book_id], unique: true
    end
  end
end
