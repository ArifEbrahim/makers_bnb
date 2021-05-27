require 'pg'
require 'date'

class Booking

  @connection = if ENV['ENVIRONMENT'] == 'test'
                  PG.connect(dbname: 'makers_bnb_test')
                else
                  PG.connect(dbname: 'makers_bnb')
                end

  def self.create(start_date:, listing_id:, guest_id:)
    return false unless is_available?
    @listing_id = listing_id
    @booking_start_date = start_date
    @connection.exec("INSERT INTO bookings (start_date, listing_id, guest_id) VALUES ('#{start_date}', '#{listing_id}', '#{guest_id}') RETURNING *;")
  end

  private

  def self.is_available?
   
    listing_dates = @connection.exec("SELECT (start_date, end_date) FROM listings WHERE (id = '#{@listing_id.to_i}');")
 
    # connect to listing database and extract start and end date
    # does range listing-start-date to listing-end-date include booking-start-date
    # return true or false
  end
end
