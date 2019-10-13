class Goal < ActiveRecord::Base
    belongs_to :traveler
    belongs_to :destination

    validates_presence_of :title
end 