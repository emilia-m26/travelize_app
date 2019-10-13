class Traveler < ActiveRecord::Base
    include ActiveModel::Validations
    
    has_many :goals
    has_many :destinations, through: :goals

    has_secure_password
    validates_presence_of :name, :email, :password
    #validates :email, presence: true, format: { with: /A[^@s] @[^@s] z/, allow_blank: true }
    validates :email, uniqueness: true
end 