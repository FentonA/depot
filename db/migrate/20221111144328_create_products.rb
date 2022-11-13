class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.decimal :price, precision: 0, scale: 2
      t.timestamps
    end
  end
end
