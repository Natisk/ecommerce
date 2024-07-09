# frozen_string_literal: true

class CheckoutsController < ApplicationController
  def create
    result = Stripe::CheckoutService.new(params[:cart]).call

    render json: result, status: 200
  end
end
