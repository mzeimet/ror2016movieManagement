class Video < ActiveRecord::Base
#  has_and_belongs_to_many :regisseurs
  has_and_belongs_to_many :actors
  has_and_belongs_to_many :genres
  has_one :location
  has_many :platforms, through: :locations # noetig?

  accepts_nested_attributes_for :location, allow_destroy:true

end
