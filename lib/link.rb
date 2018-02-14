require 'database_connection'

class Link
  def self.all
      result = DatabaseConnection.query("SELECT * FROM links")
      result.map { |row| row['url'] }
  end

  def self.add(website)
      DatabaseConnection.query("INSERT INTO links (url) VALUES('#{website}')")
  end

end
