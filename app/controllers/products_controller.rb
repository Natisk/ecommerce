# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.limit(10)
  end

  def show
    @product = Product.find(params[:id])
  end
end
