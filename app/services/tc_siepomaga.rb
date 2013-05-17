require "./siepomaga.rb"
require "test/unit"

class TestSiePomaga < Test::Unit::TestCase

  def test_campaigns
    page1 = SiePomaga.campaigns
    page2 = SiePomaga.campaigns(2)
    assert_not_empty(page1)
    assert_equal(25, page1.count)
    assert_equal(25, page2.count)
    assert_not_equal(page1,page2)
  end
end
