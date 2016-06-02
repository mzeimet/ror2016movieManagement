json.array!(@series) do |series|
  json.extract! series, :id, :name, :cover
  json.url series_url(series, format: :json)
end
