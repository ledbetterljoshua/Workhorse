json.array!(@facts) do |fact|
  json.extract! fact, :id, :hours, :pets, :happyhour, :fullbar, :bikeracks, :music, :games, :wifi, :reservations, :smoking, :parking, :whattoexpect
  json.url fact_url(fact, format: :json)
end
