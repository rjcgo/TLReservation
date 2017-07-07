class Reservation < ApplicationRecord
     belongs_to :testline, :optional =>true
    belongs_to :user, :optional =>true
end
