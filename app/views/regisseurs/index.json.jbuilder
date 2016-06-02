json.array!(@regisseurs) do |regisseur|
  json.extract! regisseur, :id, :name, :cover
  json.url regisseur_url(regisseur, format: :json)
end
