require 'pg'
require 'date'


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
    
    start_date = Date.parse(result[0]['start_date'])
    end_date = Date.parse(result[0]['end_date'])
    booking_start_date = Date.parse(@booking_start_date)

   booking_start_date.between?(start_date, end_date)

  end
end