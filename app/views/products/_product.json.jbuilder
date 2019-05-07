json.extract! product, :id, :title, :description, :goal_price, :current_price, :due_date, :state, :created_at, :updated_at
json.url product_url(product, format: :json)
