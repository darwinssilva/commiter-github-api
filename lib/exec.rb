require 'date'
require_relative 'list_expand'
require_relative 'request_url'
require_relative 'writer'

class Exec
  attr_accessor :author, :project, :colums_to_write, :url_column

  def initialize(author, project, colums_to_write, url_column = 'url')
    @author = author
    @project = project
    @colums_to_write = colums_to_write
    @url_column = url_column
  end

  def execute
    request = RequestUrl.new("https://api.github.com/repos/#{author}/#{project}/contributors").request
    list = ListExpand.new(request).list("contributions", url_column)
    Writer.new(colums_to_write, list).write("#{project}+#{DateTime.now.strftime("%d-%m-%Y--%H:%M")}.txt")
    puts "done"
  end
end