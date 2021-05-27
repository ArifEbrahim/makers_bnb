require 'listing'

describe Listing do
  describe '.create' do
    it 'creates a new listing' do
      listing = Listing.create(
        address: "1 example road", 
        name: "Central London flat", 
        description: "Gorgeous two-bedroom flat on Example road", 
        price: "89.00",
        start_date: '2021-08-03',
        end_date: '2021-08-14')
      expect(listing.address).to eq "1 example road"
      expect(listing.name).to eq "Central London flat"
      expect(listing.description).to eq "Gorgeous two-bedroom flat on Example road"
      expect(listing.price).to eq "89.00"
      expect(listing.start_date).to eq('2021-08-03')
      expect(listing.end_date).to eq('2021-08-14')
    end
  end
  
  describe '.all' do
    it "returns all listings" do
      Listing.create(
        address: "1 example road", 
        name: "Central London flat", 
        description: "Gorgeous two-bedroom flat on Example road", 
        price: "89.00",
        start_date: '2021-08-03',
        end_date: '2021-08-14')

      Listing.create(
        address: "2 example road", 
        name: "Central London flat", 
        description: "Gorgeous two-bedroom flat on Example road", 
        price: "89.00",
        start_date: '2021-08-10',
        end_date: '2021-08-17')

      expect(Listing.all.length).to eq 2
      expect(Listing.all.first.address).to eq "1 example road"
      expect(Listing.all.first.start_date).to eq('2021-08-03')
      expect(Listing.all.first.end_date).to eq('2021-08-14')
    end
  end
end