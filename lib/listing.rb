require 'pg'

class Listing
  attr_reader :id, :address, :name, :description, :price

  def initialize(id:, address:, name:, description:, price:)
    @id = id
    @address = address
    @name = name
    @description = description
    @price = price
  end

  def self.create(address:, name:, description:, price:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    result = connection.exec("INSERT INTO listings (address, name, description, price) VALUES('#{address}', '#{name}', '#{description}', '#{price}') RETURNING id, address, name, description, price;")

    Listing.new(
      id: result.first['id'], 
      address: result.first['address'], 
      name: result.first['name'], 
      description: result.first['description'], 
      price: result.first['price'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    result = connection.exec("SELECT * FROM listings")
    result.map do |listing|
      Listing.new(
        id: listing['id'], 
        address: listing['address'], 
        name: listing['name'], 
        description: listing['description'], 
        price: listing['price'])
    end
  end
end