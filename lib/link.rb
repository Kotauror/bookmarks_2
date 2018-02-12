require 'pg'

class Link
  def self.all
      connection = PG.connect :dbname => 'bookmark_manager'

      result = connection.exec "SELECT * FROM links"

      result.map do |row|
        row['url']
      end
  end
end
