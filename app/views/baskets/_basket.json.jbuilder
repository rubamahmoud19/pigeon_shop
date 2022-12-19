json.extract! basket, :id, :total, :discount, :to_pay, :created_at, :updated_at
json.url basket_url(basket, format: :json)
