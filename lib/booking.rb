require 'pg'
require 'date'

class Booking
  def self.create(start_date:, listing_id:, guest_id:)
    @start_date = start_date
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'makers_bnb_test')
                 else
                   PG.connect(dbname: 'makers_bnb')
                 end

    connection.exec("INSERT INTO bookings (start_date, listing_id, guest_id) VALUES ('#{start_date}', '#{listing_id}', '#{guest_id}') RETURNING *;")
  end

  private

  def availability_check(start_date, listing_id)
    #connect to listing database and extract start and end date
    #does range listing-start-date to listing-end-date include booking-start-date
    #return true or false
  end

end
