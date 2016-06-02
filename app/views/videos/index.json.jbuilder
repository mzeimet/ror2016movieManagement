json.array!(@videos) do |video|
  json.extract! video, :id, :videoType, :name, :seen, :length, :cover, :release, :raiting, :summary, :ageRating, :note
  json.url video_url(video, format: :json)
end
