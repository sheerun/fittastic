class Campaign < ActiveRecord::Base
  # "aim" - "Cel: 100"
  # "user" - "Krystyna"
  # "purpose" - "Oliwkowe drzewko"
  # "occasion" - "urodziny"
  # "link" - "http://siepom..."
  # "rised" - "15%"
  # "photo" - "http://amazon..."
  has_many :teams
  has_many :archived_fundraisers

  def self.by_slug(slug)
    Siepomaga.campaigns.select { |c| c.slug == slug }.first or raise Exception.new("Cannot find campaign")
  end
end
