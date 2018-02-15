require 'pg'

task :test_database_setup do
  p 'Setting up test database...'

  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("TRUNCATE links;")

  connection.exec("INSERT INTO links VALUES(1, 'http://www.makersacademy.com', 'Makers Academy');")
  connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com', 'Google');")
  connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com', 'Facebook');")
end

task :setup do
  connection = PG.connect("CREATE DATABASE bookmark_manager;")
  connection = PG.connect("CREATE DATABASE bookmark_manager_test;")

  connection = PG.connect(dbname: 'bookmark_manager')
  connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(100));")

  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(100));")
end
