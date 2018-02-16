require 'pg'
require_relative './database_connection'

class Comment

  attr_reader :id, :text, :link_id

  def initialize(id, text, link_id)
    @id = id
    @text = text
    @link_id = link_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM comments")
    result.map { |hash| Comment.new(hash['id'], hash['text'], hash['link_id']) }
  end

  def self.add(text, link_id)
    return false unless is_id?(link_id)
    DatabaseConnection.query("INSERT INTO comments (text, link_id) VALUES('#{text}', '#{link_id}')")
  end

  private

  def self.is_id?(id)
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| link['id'] }.include?(id)
  end
end
