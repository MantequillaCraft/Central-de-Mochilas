json.extract! reserve_or_purchase, :id, :desired_quantity, :payment_method, :product_id, :customer_id, :created_at, :updated_at
json.url reserve_or_purchase_url(reserve_or_purchase, format: :json)
