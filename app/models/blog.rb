class Blog < ActiveRecord::Base
  attr_accessible :content, :title, :email
end
