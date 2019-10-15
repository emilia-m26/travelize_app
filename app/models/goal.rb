class Goal < ActiveRecord::Base
    belongs_to :traveler
<<<<<<< HEAD
    belongs_to :destination
=======
    #has_many :destinations
>>>>>>> master-1

    validates_presence_of :title
end 