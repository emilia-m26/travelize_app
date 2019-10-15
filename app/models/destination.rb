<<<<<<< HEAD
class Destination < ActiveRecord::Base
    has_many :goals
    has_many :travelers, through: :goals
end 
=======
#class Destination < ActiveRecord::Base
    #belongs_to :goal
    #has_many :travelers, through: :goals
#end 

#extending functionality at a later time.
>>>>>>> master-1
