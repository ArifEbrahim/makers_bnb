require "pg"

def truncate_test_data
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec("TRUNCATE TABLE listings;")
end