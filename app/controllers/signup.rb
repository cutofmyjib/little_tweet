get '/signup' do
  #  yeild the form to create a new user
  erb :signup
end


post '/new_user' do
  # post route to recieve new user information.

  @user = User.new(name: params[:name],
                   email: params[:email],
                   user_name: params[:username])
  @user.password = params[:password]
  @user.save!

  redirect '/'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user.password == params[:password]
    session[:user_id] = @user.id
  else
    erb :signin
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
