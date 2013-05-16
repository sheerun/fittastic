class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :facebook_place
end
