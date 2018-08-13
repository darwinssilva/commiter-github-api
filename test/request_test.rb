require_relative '../lib/request_url'
require "test/unit"

class RequestUrlTest < Test::Unit::TestCase

  def invalid_url
    assert_raise do
      RequestUrl.new("http://invalid").request
    end
  end

  def valid_url
    assert_kind_of(String, RequestUrl.new("http://Google.com").request)
  end

end