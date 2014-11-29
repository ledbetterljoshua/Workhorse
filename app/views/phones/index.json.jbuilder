json.array!(@phones) do |phone|
  json.extract! phone, :id, :description
  json.url phone_url(phone, format: :json)
end
