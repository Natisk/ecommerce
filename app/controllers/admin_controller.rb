# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authenticate_admin!

  layout 'admin'

  def index
    today_start = Time.zone.now.midnight
    today_end = today_start.end_of_day

    query = <<-SQL
      SELECT
        COUNT(DISTINCT orders.id) AS orders_count,
        COUNT(DISTINCT order_products.id) AS order_products_count,
        SUM(total) AS total_sum,
        AVG(total) AS total_average
      FROM orders
      LEFT JOIN order_products ON orders.id = order_products.order_id
      WHERE orders.created_at >= '#{today_start}' AND orders.created_at <= '#{today_end}'
    SQL

    todays_orders = ActiveRecord::Base.connection.execute(query).first

    @dashboard_data = {
      revenue: todays_orders['total_sum'],
      orders_count: todays_orders['orders_count'],
      avg_sale: todays_orders['total_average'],
      per_sale: todays_orders['order_products_count']
    }
  end
end
