json.array!(@jukeboxes) do |jukebox|
  json.extract! jukebox, :id, :description
  json.url jukebox_url(jukebox, format: :json)
end
