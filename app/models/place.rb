
class Place < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :photos #creating association in the database between the place and photo
    geocoded_by :address
    after_validation :geocode


    validates :address, presence: true
    validates :description, presence: true
    validates :name, presence: true, length: {minimum: 3}
end