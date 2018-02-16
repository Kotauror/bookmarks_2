require 'pg'
require_relative './database_connection'

class Comment

  attr_reader :url, :id, :text

  def initialize(id, text, link_id)
    @id = id
    @text = text
    @link_id = link_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM comments")
    result.map { |hash| Comment.new(hash['id'], hash['text'], hash['link_id']) }
  end

  def self.add(text)
    DatabaseConnection.query("INSERT INTO comments (text) VALUES('#{text}')")
  end
end
