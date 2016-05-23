json.array!(@movies) do |movie|
  json.extract! movie, :id, :name, :seen, :lenght, :relasedate, :rating, :description
  json.url movie_url(movie, format: :json)
end
