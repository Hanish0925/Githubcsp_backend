class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :rating
      t.text :review_text

      t.timestamps
    end
  end
end
