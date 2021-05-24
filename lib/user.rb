require 'pg'
require 'bcrypt'
require 'byebug'

class User

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    # encrypt the plantext password
    encrypted_password = BCrypt::Password.create(password)

    if ENV['ENVIRONMENT'] == 'test'
     connection =  PG.connect(dbname:'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    result = connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{encrypted_password}') RETURNING id, email;")
    
    User.new(id: result[0]['id'], email: result[0]['email'])

  end

  def self.find(user_id)
    return nil unless user_id

    if ENV['ENVIRONMENT'] == 'test'
     connection =  PG.connect(dbname:'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
    result = connection.exec("SELECT * FROM users WHERE id = '#{user_id}'")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end 

end 