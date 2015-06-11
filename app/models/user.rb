require 'bcrypt'

class User < ActiveRecord::Base

 validates :user_name, uniqueness: true
 validates :email, uniqueness: true


  # users.password_hash in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
