class Writer

  attr_accessor :columns, :list

  def initialize(columns, list)
    @columns = columns
    @list = list
  end

  def write(filename)
    file = File.new("output/#{filename}", 'w')
    list.each do |line|
      write = columns.map{|column| line[column]}.join(";")
      puts write
      file.puts(write)
    end
    file.close
  end
end