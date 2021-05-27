require 'pg'

class Booking
  def self.create(start_date:, listing_id:, guest_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    connection.exec("INSERT INTO bookings (start_date, listing_id, guest_id) VALUES ('#{start_date}', '#{listing_id}', '#{guest_id}') RETURNING *;")
  end
end