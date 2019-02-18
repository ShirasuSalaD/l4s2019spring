class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :image_url
      t.integer :category_id
      t.timestamps null: false
    end
  end
end
