require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makers_bnb_test')

  # Clean the bookmarks table
  connection.exec("TRUNCATE users;")
end