class Testline < ActiveRecord::Base
    has_many :reservations
    validates :name, presence: true, uniqueness: true
end
