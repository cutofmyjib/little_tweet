get '/signup' do
  #  yeild the form to create a new user
  erb :signup
end


post '/new_user' do
  # post route to recieve new user information.
  p params
  @user = User.new(name: params[:name],
                   email: params[:email],
                   user_name: params[:username])
  p @user
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
  if @user && @user.password_hash == params[:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @users.errors
    erb :sign_in
  end
end

delete '/sessions' do
  # LOGOUT functionality
  session[:user_id] = nil
  redirect '/'
end

get '/' do
  # if session[user_id]

end
