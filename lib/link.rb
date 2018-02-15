require 'pg'
require_relative './database_connection'

class Link

  attr_reader :url, :id

  def initialize(id, url)
    @id = id
    @url = url
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |hash| Link.new(hash['id'], hash['url']) }
  end

  def self.add(website)
    return false unless is_url?(website)
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{website}')")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
