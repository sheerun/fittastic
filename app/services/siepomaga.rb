require 'httparty'
require 'nokogiri'

class SiePomaga
  include HTTParty

  base_uri "siepomaga.pl"
  @query_string = ""

  # Wrap .fundrise Nokogiri html node as a hash
  protected
  def self.wrap_fundrize(fundrize)
    Hash[
      "aim", fundrize.search(".aim").text,
      "user", fundrize.search(".user h4").text,
      "purpose", fundrize.search(".collect strong").text,
      "occasion", fundrize.search(".occasion strong").text,
      "link", fundrize.search(".user h4 a").attribute("href").value(),
      "rised", fundrize.search(".can .mini_can[title]").text,
      "photo", fundrize.search(".photo img").attribute("src").value()
    ]
  end

  # Returns selected page of campaigns (25 enteries) ordered by date (descending)
  def self.campaigns(page=1)
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
