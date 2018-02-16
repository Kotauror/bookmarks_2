require 'pg'

task :test_database_setup do
  p 'Setting up test database...'

  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("TRUNCATE comments, links;")

  connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com', 'Makers Academy');")
  connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com', 'Google');")
  connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com', 'Facebook');")
  connection.exec("INSERT INTO comments (id, text) VALUES(1, 'bootcamp');")
end

task :setup do
  p "Creating databases..."
  ["bookmark_manager", "bookmark_manager_test"].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database}")
    connection = PG.connect(dbname: "#{database}")
    connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));")
    connection.exec("CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), link_id INTEGER REFERENCES links (id));")
    connection.exec("CREATE TABLE tags(id SERIAL PRIMARY KEY, content VARCHAR(60);")
    connection.exec("CREATE TABLE link_tags(id SERIAL PRIMARY KEY, link_id INTEGER REFERENCES links (id), tag_id INTEGER REFERENCES tang (id);")
  end
end

task :teardown do
  p "Tearing down databases..."

  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{ database };")
  end
end
