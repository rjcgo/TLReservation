class Reservation < ActiveRecord::Base
  belongs_to :testline, :dependent => :destroy
  validates :name, presence: true
end
