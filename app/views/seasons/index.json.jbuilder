json.array!(@seasons) do |season|
  json.extract! season, :id, :number, :cover
  json.url season_url(season, format: :json)
end
