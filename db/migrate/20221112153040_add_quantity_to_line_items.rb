class AddQuantityToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :line_items, :quantitiy, :integer, default: 1
  end
end
Ï