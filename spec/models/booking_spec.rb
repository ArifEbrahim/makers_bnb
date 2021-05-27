require 'booking'

RSpec.describe Booking do
  describe '.create' do
    it 'saves booking data to the boking table' do
      booking = Booking.create(
        start_date: '01/01/2021',
        listing_id: '123',
        guest_id: '99',
      )
      expect(booking.first['start_date']).to eq('01/01/2021')
      expect(booking.first['listing_id']).to eq('123')
      expect(booking.first['guest_id']).to eq('99')
      
    end
  end
end