require 'pg'
require_relative './database_connection'

class Tag

  attr_reader :id, :content

  def initialize(id, content)
    @id = id
    @content = content
  end

  def self.all_pairs
    DatabaseConnection.query("SELECT * FROM link_tags")
  end

  def self.all_tags
    result = DatabaseConnection.query("SELECT * FROM tags")
    result.map { |hash| Tag.new(hash['id'], hash['content']) }
  end

  def self.add_to_tags(tag)
    DatabaseConnection.query("INSERT INTO tags (content) VALUES('#{tag}')")
  end

  def self.add_to_link_tags(link_id, tag_id)
    DatabaseConnection.query("INSERT INTO link_tags (link_id, tag_id) VALUES('#{link_id}', '#{tag_id}')")
  end

  private

  def self.get_tag_id(tag)
    result = DatabaseConnection.query("SELECT * FROM tags")
    result.map { |hash| return hash['id'] if hash['content'] == tag }
  end

end
