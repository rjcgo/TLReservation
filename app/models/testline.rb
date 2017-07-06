class Testline < ApplicationRecord
    has_many :reservations
    belongs_to :user
    
end
