class Campaign < ActiveRecord::Base
  has_many :teams
  has_many :archived_fundraisers
end
