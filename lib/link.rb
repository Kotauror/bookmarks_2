require 'pg'
require_relative './database_connection'

class Link

  def self.all
    result = DatabaseConnection.query("SELECT * FROM links")
    result.map { |row| row['url'] }
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
