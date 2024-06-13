# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post = []

  end
end
