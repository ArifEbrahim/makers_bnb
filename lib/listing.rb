require 'pg'

class Listing
  attr_reader :id, :address

  def initialize(id:, address:)
    @id = id
    @address = address
  end

  def self.create(address)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    result = connection.exec("INSERT INTO listings (address) VALUES('#{address}') RETURNING id, address;")

    Listing.new(id: result.first['id'], address: result.first['address'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    result = connection.exec("SELECT * FROM listings")
    result.map do |listing|
      Listing.new(id: listing['id'], address: listing['address'])
    end
  end
end