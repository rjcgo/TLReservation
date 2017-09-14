class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, #registerable 
          #:recoverable, :rememberable, 
          :trackable, :validatable
  
  has_one :reservation
  belongs_to :team
end
