class CreateMenus < ActiveRecord::Migration[7.2]
  def change
    create_table :menus do |t|
      t.date :week_start_date
      t.json :breakfast_items
      t.json :lunch_items
      t.json :dinner_items

      t.timestamps
    end
  end
end
