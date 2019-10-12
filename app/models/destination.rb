class Destination < ActiveRecord::Base
    belongs_to :goal
    #has_many :travelers, through: :goals
end 