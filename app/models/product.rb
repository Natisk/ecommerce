# frozen_string_literal: true

# a class to create products
class Product < ApplicationRecord
  belongs_to :category
end
