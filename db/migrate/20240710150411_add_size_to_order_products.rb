# frozen_string_literal: true

class AddSizeToOrderProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :order_products, :size, :string
  end
end
