require "pg"

def setup_test_database
  connection = PG.connect(dbname: 'makers_bnb_test')

  # Clear the users and peeps table after the test
  connection.exec("TRUNCATE users")
end
