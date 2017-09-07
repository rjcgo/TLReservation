class Reservation < ActiveRecord::Base
  belongs_to :testline
  belongs_to :team
  belongs_to :user
  has_many :recipients, :dependent => :delete_all
end
