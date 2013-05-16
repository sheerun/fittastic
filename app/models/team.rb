class Team < ActiveRecord::Base
  has_many :members
  belongs_to :campaign
  has_many :archived_fundraisers
end
