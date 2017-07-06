class Reservation < ApplicationRecord
    belongs_to :testline
    belongs_to :user
end
