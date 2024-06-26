# frozen_string_literal: true

# a class to create products
class Product < ApplicationRecord
  belongs_to :category

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
    attachable.variant :medium, resize_to_limit: [250, 250]
  end
  has_many :stocks
  has_many :order_products
  has_many :orders, through: :order_products
end
