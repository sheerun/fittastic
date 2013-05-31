class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :facebook_place
  
  validates :description, :presence => true

  def value
    0
  end
end
