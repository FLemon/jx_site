class User < ActiveRecord::Base
  attr_accessible :email, :name, :access_granted
end
