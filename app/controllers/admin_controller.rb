# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authenticate_admin!

  layout 'admin'

  def index
    today_start = Time.zone.now.midnight - 7.days
    today_end = Time.zone.now.midnight.end_of_day

    query = <<-SQL
      SELECT
        COUNT(DISTINCT orders.id) AS orders_count,
        COUNT(DISTINCT order_products.id) AS order_products_count,
        SUM(total) AS total_sum,
        AVG(total) AS total_average
      FROM orders
      LEFT JOIN order_products ON orders.id = order_products.order_id
      WHERE orders.created_at >= '#{today_start}' AND orders.created_at <= '#{today_end}';
    SQL

    todays_orders = ActiveRecord::Base.connection.execute(query).first

    @dashboard_data = {
      revenue: todays_orders['total_sum'],
      orders_count: todays_orders['orders_count'],
      avg_sale: todays_orders['total_average'],
      per_sale: todays_orders['order_products_count']
    }

    day_names = Date::DAYNAMES
    initial_stat_hash = day_names.map { |day| [day, 0] }.to_h # { [Sunday: 0], [Monday: 0], [Tuesday: 0], ....}

    orders_by_day = Order
      .select("EXTRACT(DOW FROM created_at) AS day_of_week, SUM(total) AS total_sum")
      .where("created_at > ?", Time.now.midnight - 7.days)
      .group("day_of_week")
      .order("day_of_week")

    orders_by_day = orders_by_day.map { |order| [day_names[order.day_of_week.to_i], order.total_sum.to_f] }.to_h

    @revenue_by_day = initial_stat_hash.merge!(orders_by_day).to_a

    @unfulfilled_orders = Order.where(fulfilled: false).order(created_at: :desc).limit(10)
  end
end
