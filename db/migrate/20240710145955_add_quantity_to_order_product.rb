# frozen_string_literal: true

class AddQuantityToOrderProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :order_products, :quantity, :integer
  end
end
