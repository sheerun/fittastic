class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :facebook_place
  has_many :upvotes, :class_name => "Upvote"
  
  validates :description, :presence => true

  def value
    self.upvotes.size
  end
end
