require 'booking'

RSpec.describe Booking do
  describe '.create' do
    it 'saves booking data to the boking table' do
      listing = Listing.create(
        address: "1 example road", 
        name: "Central London flat", 
        description: "Gorgeous two-bedroom flat on Example road", 
        price: "89.00",
        start_date: '01/01/2021',
        end_date: '02/02/2021')
      user = User.create(
        email: 'test@example.com', 
        password: 'password123')
      booking = Booking.create(
        start_date: '01/01/2021',
        listing_id: listing.id,
        guest_id: user.id,
      )
      expect(booking.first['start_date']).to eq('01/01/2021')
      expect(booking.first['listing_id']).to eq(listing.id)
      expect(booking.first['guest_id']).to eq(user.id)
      
    end
  end
end