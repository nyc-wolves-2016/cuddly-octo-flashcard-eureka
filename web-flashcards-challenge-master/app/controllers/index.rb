get '/' do
  redirect '/decks'
end

get '/session-viewer' do
	session.inspect
end

get '/login' do
	erb :'sessions/login'
end

post '/login' do
	user = User.find_by(username: params[:username])
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect '/login'
	else
		# redirect '/login'
		erb :'sessions/login'
	end
end

get '/register' do
  erb :'sessions/register'
 end

post '/register' do
 
  user = User.new(params[:new_user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'sessions/register'
  end
end

get '/logout' do
  session.clear
  redirect '/login'
end