class Destination < ActiveRecord::Base
    has_many :goals
    has_many :travelers, through: :goals
end 