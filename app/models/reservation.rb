class Reservation < ActiveRecord::Base
  belongs_to :testline
  validates :name, presence: true
end
