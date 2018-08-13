require_relative "../lib/writer"
require "test/unit"

class WriterTest < Test::Unit::TestCase
  def created_file
    Writer.new([:a, :b], [{a: 1, b: 2}, {a: 3, b: 4}]).write("file")
    assert(File.exist?("output/file"))
  end

  def lines_file
    Writer.new([:a, :b], [{a: 1, b: 2}, {a: 3, b: 4}]).write("lines")
    lines = File.readlines("output/lines")
    assert(lines == ["1;2\n", "3;4\n"])
  end
end