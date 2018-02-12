require 'pg'

class Link
  def self.all
      array = []

      con = PG.connect :dbname => 'bookmark_manager'

      rs = con.exec "SELECT * FROM links"

      rs.each do |row|
        array << "%s" % [ row['url'] ]
      end

      array
  end
end
