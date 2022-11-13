class CombineItemsInCart < ActiveRecord::Migration[6.0]
  def change
  end

  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantitiy)
      sums.each do |product_id, quantitiy|
        if quantitiy > 1
          cart.line_items.where(product_id: product_id).delete_all

          item = cart.line_items.build(product_id: product_id)
          item.quantitiy = quantitiy
          item.save
        end
      end
    end
  end

  def down
    LineItem.where('quantitiy>1').each do |line_item|
      line_item.quantitiy.times do
        LineItem.create(
          cart_id: line_item.cart_id,
          product_id: line_item.product_id,
          quantitiy: 1
        )
      end

      line_item.destroy
  end
  end

  end
