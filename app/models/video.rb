class Video < ActiveRecord::Base
  has_and_belongs_to_many :regisseurs
  has_and_belongs_to_many :actors
  has_and_belongs_to_many :genres

end
