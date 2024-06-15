# frozen_string_literal: true

# a class to create products
class Product < ApplicationRecord
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end

  belongs_to :category
end
