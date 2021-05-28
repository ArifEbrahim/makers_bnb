require 'pg'
require 'date'
require 'listing'

class Booking
  @connection = if ENV['ENVIRONMENT'] == 'test'
                  PG.connect(dbname: 'makers_bnb_test')
                else
                  PG.connect(dbname: 'makers_bnb')
                end

  def self.create(start_date:, listing_id:, guest_id:)
       @listing_id = listing_id
    @booking_start_date = start_date
  
    return false unless is_available?

 
    @connection.exec("INSERT INTO bookings (start_date, listing_id, guest_id) VALUES ('#{start_date}', '#{listing_id}', '#{guest_id}') RETURNING *;")
  end

  private


  def self.is_available?
   
    result = @connection.exec("SELECT * FROM listings WHERE id = '#{@listing_id.to_i}';")
   p  start_date = result[0]['start_date']
  p end_date = result[0]['end_date']
  p booking_start_date = @booking_start_date

    # does range listing-start-date to listing-end-date include booking-start-date
    # return true or false
  end
end
