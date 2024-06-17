json.extract! order, :id, :customer_email, :fulfilled, :total, :address, :created_at, :updated_at
json.url order_url(order, format: :json)
