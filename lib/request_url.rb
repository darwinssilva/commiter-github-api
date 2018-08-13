require 'open-uri'

class RequestUrl
  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def request
    content = open(url).read
  end

end