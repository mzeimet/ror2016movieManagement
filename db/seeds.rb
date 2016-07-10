# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ackles = Actor.create(name: 'Jensen Ackles')
padelecki = Actor.create(name: 'Jared Padelecki')
dicaprio = Actor.create(name: 'Leonado Dicaprio')
wahlberg = Actor.create(name: 'Mark Wahlberg')
sandler = Actor.create(name: 'Adam Sandler')
downey = Actor.create(name: 'Robert Downey Jr.')
evans = Actor.create(name: 'Chris Evans')
leto = Actor.create(name: 'Jared Leto')
hogan = Actor.create(name: 'Hulk Hogan')
fox = Actor.create(name: 'Megan Fox')

supernatural = Series.create(name: 'Supernatural')
arrow = Series.create(name: 'Arrow')
theflash = Series.create(name: 'The Flash')
aos = Series.create(name: 'Agents of Shield')

1.upto(5) do |i|
    season = Season.create(number: i.to_s)
    1.upto(5) do |j|
        episode = Episode.create(episodeNumber: j.to_s)
        video = Video.create(videoType: '2', name: "Supernatural S#{i}E#{j}", seen: 'false', length: '42', release: Date.yesterday, raiting: '100', ageRating: '18', note: 'geil')
        location = Location.create(description: 'Links unterm Bett')
        platform = Platform.create(name: 'Amazon', borrowed: 'false')
        location.platforms << platform
        video.location = location
        video.actors << ackles
        video.actors << padelecki
        episode.video = video
        season.episodes << episode
    end
    supernatural.seasons << season
end

horror = Genre.create(name: 'Horror')
porno = Genre.create(name: 'Porno')
action = Genre.create(name:'Action')

spuelberg = Regisseur.create(name: 'Steven Spuehlberg')
spielberg = Regisseur.create(name: 'Steven Spielberg')
bay = Regisseur.create(name: 'Michael Bay')

transformers = Video.create(videoType: '1', name: "Transformers", seen: 'false', length: '142', release: Date.yesterday, raiting: '0', ageRating: '12', note: 'naah')
translocation = Location.create(description: 'Muelleimer')
transplatform = Platform.create(name: 'Netflix', borrowed: 'false')
translocation.platforms << transplatform
transformers.location = translocation
couchcasting = Video.create(videoType: '1', name: "Couchcasting", seen: 'true', length: '3', release: Date.yesterday, raiting: '69', ageRating: '18', note: 'gg')
couchlocation = Location.create(description: 'Nachtschrank')
couchplatform = Platform.create(name: 'Netflix', borrowed: 'false')
couchlocation.platforms << couchplatform
couchcasting.location = couchlocation


transformers.genres << horror
transformers.genres << action
transformers.actors << wahlberg
transformers.actors << fox
transformers.regisseurs << bay


couchcasting.genres << porno
couchcasting.actors << hogan
