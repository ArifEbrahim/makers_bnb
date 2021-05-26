require 'listing'

describe Listing do
  describe '.create' do
    it 'creates a new listing' do
      listing = Listing.create(
        address: "1 example road", 
        name: "Central London flat", 
        description: "Gorgeous two-bedroom flat on Example road", 
        price: "89.00")
      expect(listing.address).to eq "1 example road"
      expect(listing.name).to eq "Central London flat"
      expect(listing.description).to eq "Gorgeous two-bedroom flat on Example road"
      expect(listing.price).to eq "89.00"
    end
  end
  
  describe '.all' do
    it "returns all listings" do
      Listing.create(
        address: "1 example road", 
        name: "Central London flat", 
        description: "Gorgeous two-bedroom flat on Example road", 
        price: "89.00")
      Listing.create(
        address: "2 example road", 
        name: "Central London flat", 
        description: "Gorgeous two-bedroom flat on Example road", 
        price: "89.00")

      expect(Listing.all.length).to eq 2
      expect(Listing.all.first.address).to eq "1 example road"
    end
  end
end