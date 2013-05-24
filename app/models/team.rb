class Team < ActiveRecord::Base
  has_many :archived_fundraisers
  has_many :members
  has_many :users, :through => :members

  belongs_to :campaign

  validates :name, :presence => true
  validates :nip, :presence => true
  validates :budget, 
    :presence => true, 
    :numericality => { :only_integer => true, :greather_than => 0 }
end
