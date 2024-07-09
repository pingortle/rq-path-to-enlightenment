json.extract! koan, :id, :title, :description, :initial_code, :order, :created_at, :updated_at
json.url koan_url(koan, format: :json)
