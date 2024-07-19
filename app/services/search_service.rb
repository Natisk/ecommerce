# frozen_string_literal: true

# Service to search on admin dashboard
class SearchService
  attr_reader :model, :query

  def initialize(model, query)
    @model = model
    @query = query
  end

  def call
    model.where('name ILIKE ?', "%#{query}%")
  end
end
