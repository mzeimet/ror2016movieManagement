json.array!(@episodes) do |episode|
  json.extract! episode, :id, :episodeNumber
  json.url episode_url(episode, format: :json)
end
