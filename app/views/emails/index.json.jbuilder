json.array!(@emails) do |email|
  json.extract! email, :id, :description
  json.url email_url(email, format: :json)
end
