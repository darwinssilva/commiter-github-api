require 'json'

class ListExpand
  attr_accessor :response

  def initialize(response)
    @response = response
  end

  def list(order, expansible_column = nil)
    parse
    expand(expansible_column) if expansible_column
    @list.sort{ |first, second| second[order] <=> first[order] }
  end

  private

  def expand(url_column)
    @list = @list.map do |result|
      second_depth = JSON.parse(RequestUrl.new(result[url_column]).request)
      result.merge(second_depth)
    end
  end

  def parse
    @list = JSON.parse(response)
  end
end