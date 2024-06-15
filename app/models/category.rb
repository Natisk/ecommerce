# frozen_string_literal: true

# a class to create categories
class Category < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end

  has_many :products
end
