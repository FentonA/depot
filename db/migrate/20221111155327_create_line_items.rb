class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.references :product
      t.belongs_to :cart

      t.timestamps
    end
  end
end
