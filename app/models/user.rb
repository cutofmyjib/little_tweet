class User < ActiveRecord::Base

 has_many :tweets

 has_many :followers, :through => :following_relationships
 has_many :follower_relationships, :class_name => "Relationship", :foreign_key => "follower_id"

 has_many :following_relationships, :class_name => "Relationship", :foreign_key => "following_id"
 has_many :following, :through => :follower_relationships


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

  def follow(user)
    self.following << user
    self.save

  end

end
