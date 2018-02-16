require 'pg'
require_relative './database_connection'

class Tag

  attr_reader :id, :content

  def initialize(id, content)
    @id = id
    @content = content
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM tags")
    result.map { |hash| Tag.new(hash['id'], hash['content']) }
  end

  def self.add_to_tags(tag)
    DatabaseConnection.query("INSERT INTO tags (content) VALUES('#{tag}')")
  end

end
