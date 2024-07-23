# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.includes(images_attachments: :blob)

    @products = @products.where('price >= ?', params[:min]) if params[:min].presence
    @products = @products.where('price <= ?', params[:max]) if params[:max].presence
  end
end
