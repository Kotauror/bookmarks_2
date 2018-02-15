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

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
