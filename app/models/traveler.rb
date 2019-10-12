class Traveler < ActiveRecord::Base
    has_many :goals
    has_many :destinations, through: :goals
end 