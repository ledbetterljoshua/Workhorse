json.array!(@foods) do |food|
  json.extract! food, :id, :description
  json.url food_url(food, format: :json)
end
