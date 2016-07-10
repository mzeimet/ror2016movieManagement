class Video < ActiveRecord::Base
    has_and_belongs_to_many :actors
    has_and_belongs_to_many :genres
    has_and_belongs_to_many :regisseurs
    has_many :platforms, through: :location
    has_many :episodes, validate: false
    has_one :location, dependent: :destroy

    accepts_nested_attributes_for :location
    accepts_nested_attributes_for :platforms
    accepts_nested_attributes_for :episodes

    mount_uploader :cover, PictureUploader

    validates :name, presence: true, length: { minimum: 3 }
    validates :raiting, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_nil: true
    validates :ageRating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 22 }, allow_nil: true
    validate :relase_cannot_be_in_the_future

    validates_associated :location
    validates_associated :platforms

    def relase_cannot_be_in_the_future
         if !release.nil? && release > Date.today
            errors.add(:release, "can't be in the future")
        end
    end
end
