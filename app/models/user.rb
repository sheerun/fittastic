class User < ActiveRecord::Base
  has_many :teams, :through => :members
end
