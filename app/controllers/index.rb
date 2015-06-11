# If a user signs in
get '/' do
  redirect '/tweets'


end

get '/tweets' do
    @tweets = Tweet.all
    erb :index
end


# If a user wants to create a tweet

post '/tweets' do
  Tweet.create(body: params[:body])

  redirect to '/tweets'
end


get '/tweets/:tweet_id' do
  @tweet_id = Tweet.find_by(id: params[:tweet_id])

  erb :tweet
end

delete '/tweets/:tweet_id' do
  @tweet_id = Tweet.find_by(id: params[:tweet_id])
  @tweet_id.destroy

  redirect '/'
end
