get '/signup' do
  erb :signup
end


post '/logged_in' do
 new_user = User.create!(name: params[:name], email: params[:email], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
  redirect '/'
end
