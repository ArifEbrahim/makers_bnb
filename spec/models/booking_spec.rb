require 'booking'
require 'listing'
require 'user'

require 'pg'

RSpec.describe Booking do
  describe '.create' do
    let!(:listing) {
      Listing.create(
        address: '1 example road',
        name: 'Central London flat',
        description: 'Gorgeous two-bedroom flat on Example road',
        price: '89.00',
        start_date: '2021-08-03',
        end_date: '2021-08-14'
      )}
    
    let!(:user) {
      User.create(
        email: 'test@example.com',
        password: 'password123'
      )}
    
    it 'saves booking data to the booking table' do
      # listing = Listing.create(
      #   address: '1 example road',
      #   name: 'Central London flat',
      #   description: 'Gorgeous two-bedroom flat on Example road',
      #   price: '89.00',
      #   start_date: '2021-08-03',
      #   end_date: '2021-08-14'
      # )
      # user = User.create(
      #   email: 'test@example.com',
      #   password: 'password123'
      # )
      booking = Booking.create(
        start_date: '2021-08-05',
        listing_id: listing.id,
        guest_id: user.id
      )


      expect(booking.first['start_date']).to eq('05/08/2021')
      expect(booking.first['listing_id']).to eq(listing.id)
      expect(booking.first['guest_id']).to eq(user.id)
    end

    it 'returns false trying to book outside available dates' do
      
      booking =  Booking.create(
          start_date: '2021-10-01',
          listing_id: listing.id,
          guest_id: user.id)


      expect(booking).to be false
    end
  end
end
