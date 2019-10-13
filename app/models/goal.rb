class Goal < ActiveRecord::Base
    belongs_to :traveler
    has_many :destinations

    validates_presence_of :title
end 