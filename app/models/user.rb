class User < ActiveRecord::Base

 has_many :tweets

 has_many :followers, :through => :followed_relationships, :source => :following
 has_many :follow_relationships, :class_name => "Relationship", :foreign_key => "follower_id"

 has_many :followed_relationships, :class_name => "Relationship", :foreign_key => "following_id"
 has_many :following, :through => :follow_relationships, :source => :follower


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
