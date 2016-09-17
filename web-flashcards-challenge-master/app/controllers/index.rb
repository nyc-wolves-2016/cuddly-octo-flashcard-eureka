get '/' do
  redirect '/decks'
end

get '/session-viewer' do
	session.inspect
end

get '/sessions/login' do
	erb :'sessions/login'
end

post '/sessions/login' do
	user = User.find_by(username: params[:username])
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect '/'
	else
		# redirect '/login'
		erb :'sessions/login'
	end
end

get '/sessions/register' do
  erb :'sessions/register'
 end

post '/sessions/register' do

  user = User.new(params[:new_user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'sessions/register'
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/sessions/login'
end
