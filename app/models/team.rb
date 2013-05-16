class Team < ActiveRecord::Base
  has_many :members
  belongs_to :campaign
end
