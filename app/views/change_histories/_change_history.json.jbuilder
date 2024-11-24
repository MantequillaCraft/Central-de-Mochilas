json.extract! change_history, :id, :modification_date, :change_description, :product_id, :created_at, :updated_at
json.url change_history_url(change_history, format: :json)
