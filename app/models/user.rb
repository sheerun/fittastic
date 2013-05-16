class User < ActiveRecord::Base
  has_many :teams, :through => :members
  has_many :activities
end
