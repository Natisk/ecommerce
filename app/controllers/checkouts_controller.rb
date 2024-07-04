# frozen_string_literal: true

class CheckoutsController < ApplicationController
  def create
    Stripe::CheckoutService.new(params[:cart]).call

    render json: { error: 'It works but empty' }, status: 404
  end
end
