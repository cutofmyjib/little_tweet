# If a user signs in
get '/' do

redirect '/tweets'

end

get '/tweets' do
  #p @user = User.where(id: params[:id]).first


  if session[:user_id]
      @user = User.find(session[:user_id])
      p session
      @tweets = @user.tweets
    p "INDEX"
    erb :index
  else
    redirect '/signup'
  end
end


# If a user wants to create a tweet

post '/tweets' do
  Tweet.create(body: params[:body], user_id: session[:user_id])

  redirect to '/tweets'
end


get '/tweets/:tweet_id' do
  @tweet_id = Tweet.find_by(id: params[:tweet_id] )
  @user = User.find(session[:user_id])
  erb :tweet
end

delete '/tweets/:tweet_id' do
  @tweet_id = Tweet.find_by(id: params[:tweet_id])
  @tweet_id.destroy

  redirect '/'
end

get '/find_users' do
  @users = User.all

  erb :find_users
end

