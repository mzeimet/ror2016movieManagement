class Genre < ActiveRecord::Base
  has_and_belongs_to_many :videos

  validates :name, presence: true, length: {minimum: 3}

end
