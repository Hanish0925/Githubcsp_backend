class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :calories
      t.integer :protein
      t.integer :carbohydrates
      t.integer :fat
      t.integer :rating

      t.timestamps
    end
  end
end
