require_relative '../lib/list_expand'
require "test/unit"

class ListExpandTest
  def test_order_desc
    list = ListExpand.new("[{\"a\":100},{\"a\":2},{\"a\":36},{\"a\":4}]")
    assert(
      list.parse('a') == [{'a' => 100}, {'a' => 36}, {'a' => 4}, {'a' => 2}]
    )
  end
end