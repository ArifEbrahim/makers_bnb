require 'listing'

describe Listing do
  describe '.create' do
    it 'creates a new listing' do
      listing = Listing.create("1 example road")
      expect(listing.address).to eq "1 example road"
    end
  end
  
  describe '.all' do
    it "returns all listings" do
      Listing.create("1 example road")
      Listing.create("2 example road")

      expect(Listing.all.length).to eq 2
      expect(Listing.all.first.address).to eq "1 example road"
    end
  end
end