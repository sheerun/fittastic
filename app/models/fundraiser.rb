class Fundraiser < ActiveRecord::Base
  belongs_to :team
  belongs_to :campaign

  delegate :description, :picture, :purpose, :location, :slug,  :to => :campaign
  
  def url
    "http://www.siepomaga.pl/r/#{slug}"
  end
end
