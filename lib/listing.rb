require 'pg'

class Listing
  attr_reader :id, :address, :name, :description, :price, :start_date, :end_date

  def initialize(id:, address:, name:, description:, price:, start_date:, end_date:)
    @id = id
    @address = address
    @name = name
    @description = description
    @price = price
    @start_date = start_date
    @end_date = end_date
  end

  def self.create(address:, name:, description:, price:, start_date:, end_date:)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'makers_bnb_test')
                 else
                   PG.connect(dbname: 'makers_bnb')
                 end

    result = connection.exec("INSERT INTO listings (address, name, description, price, start_date, end_date) VALUES('#{address}', '#{name}', '#{description}', '#{price}', '#{start_date}', '#{end_date}') RETURNING id, address, name, description, price, start_date, end_date;").first

    Listing.new(
      id: result['id'],
      address: result['address'],
      name: result['name'],
      description: result['description'],
      price: result['price'],
      start_date: result['start_date'],
      end_date: result['end_date']
    )
  end

  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'makers_bnb_test')
                 else
                   PG.connect(dbname: 'makers_bnb')
                 end

    result = connection.exec('SELECT * FROM listings')
    result.map do |listing|
      Listing.new(
        id: listing['id'],
        address: listing['address'],
        name: listing['name'],
        description: listing['description'],
        price: listing['price'],
        start_date: listing['start_date'],
        end_date: listing['end_date']
      )
    end
  end
end
