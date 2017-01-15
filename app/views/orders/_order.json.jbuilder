json.extract! order, :id, :physical_id, :broker_id, :apartment_id, :created_at, :updated_at
json.url order_url(order, format: :json)