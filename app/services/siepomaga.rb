module Siepomaga extend self

  include HTTParty

  base_uri "siepomaga.pl"

  # Wrap .fundrise Nokogiri html node as a hash
  protected
  def self.wrap_fundrize(fundrize)
    photo = fundrize.search(".photo img").attribute("src").value()
    if photo[0] == "/"
      photo = base_uri + photo
    end

    Campaign.new(
      name:     fundrize.search(".aim").text,
      picture:  photo,
      slug:     base_uri+fundrize.search(".user h4 a").attribute("href").value(),
      user:     fundrize.search(".user h4").text,
      purpose:  fundrize.search(".collect strong").text,
      occasion: fundrize.search(".occasion strong").text
    )
  end

  # Returns selected page of campaigns (25 enteries) ordered by date (descending)
  public
  def campaigns(page=1)
    response = HTTParty.get(base_uri + "/r?occasion=wszystkie&order=created_at&page=#{page}")
    if response.success?
      document = Nokogiri::HTML(response.body)
      result = []
      document.search(".fundraise").each do |fundrize|
        result.push(self.wrap_fundrize(fundrize))
      end
      result
    else
      raise response.response
    end
  end

end
