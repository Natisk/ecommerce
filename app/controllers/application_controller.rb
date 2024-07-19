# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  Pagy::DEFAULT[:limit] = 7
end
