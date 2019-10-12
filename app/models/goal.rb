class Goal < ActiveRecord::Base
    belongs_to :traveler
    has_many :destinations
end 