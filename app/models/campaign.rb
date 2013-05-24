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

  def by_slug(slug)
    where(slug: slug).first
  end
end
