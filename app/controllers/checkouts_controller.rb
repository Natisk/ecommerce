# frozen_string_literal: true

class CheckoutsController < ApplicationController
  def create
    p 'create checkouts'
    render json: { error: 'It works but empty' }, status: 404
  end
end
