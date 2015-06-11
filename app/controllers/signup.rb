get '/' do

end

get '/signup' do
  #  yeild the form to create a new user
  erb :signup
end

get '/login' do
  erb :login
end

post '/new_user' do
  # post route to recieve new user information.
  @user = User.new(name: params[:name],
                   email: params[:email],
                   user_name: params[:username])
  @user.password = params[:password]

  if @user.save!
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :signup
  end
end

post '/sessions' do
  @user = User.where(email: params[:email]).first if params[:email]

  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors
    redirect '/login'
  end
end

delete '/sessions' do
  # LOGOUT functionality
  session[:user_id] = nil
  redirect '/'
end

