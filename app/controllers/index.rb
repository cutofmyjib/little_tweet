# CREATE
get '/' do

end

# READ

get '/' do
  @tweets = Tweet.all

  erb :index
end

get '/tweets' do
  @tweets = Tweet.all

  erb :tweets

end

# UPDATE


# DELETE
