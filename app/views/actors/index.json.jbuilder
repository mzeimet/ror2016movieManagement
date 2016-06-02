json.array!(@actors) do |actor|
  json.extract! actor, :id, :name, :cover
  json.url actor_url(actor, format: :json)
end
