require 'pg'
require_relative './database_connection'

class Link

  attr_reader :url, :id, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |hash| Link.new(hash['id'], hash['url'], hash['title']) }
  end

  def self.add(url, title)
    return false unless is_url?(url)
    DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{url}', '#{title}')")
  end

  def self.delete(title)
    return false unless is_title?(title)
    DatabaseConnection.query("DELETE FROM links WHERE title='#{title}'")
  end

  def self.update(title, new_title, new_url)
    DatabaseConnection.query("UPDATE links SET title='#{new_title}', url='#{new_url}' WHERE title='#{title}'")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

  def self.is_title?(title)
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |link| link['title'] }.include?(title)
  end

end
