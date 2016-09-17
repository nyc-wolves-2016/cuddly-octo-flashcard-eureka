get '/decks' do # Home page # Display all decks to choose from
	@decks = Deck.all
	erb :'decks/index'
end

get '/users/:user_id' do # User profile page
	#require_user
	erb :'games/statistics'
end

post '/users/:user_id/games' do
	# Hidden form that will create a new game instance, within the decks page
	# User never sees this post
	if logged_in?
		@game = Game.create(user_id: params[:user_id], deck_id: params[:deck_id])
		@card = 1 #card from some method
		redirect '/users/#{current_user.id}/decks/#{params[:deck_id]}/games/#{@game.id}/cards/#{@card.id}' # CHECK: @card.id ###
	else
		redirect '/login'
	end
end

get '/users/:user_id/decks/:deck_id/games/:game_id/cards/:card_id' do #display a card
	#require_user
	@deck = Deck.find(params[:deck_id])
	@card = 1 #some method from model
	@game = Game.find(params[:game_id])

	erb :'cards/show'
end

post 'users/:user_id/decks/:deck_id/games/:game_id/cards/:card_id' do
	#require_user
	@card = 1 #needs to come from method ##Card.find(params[:card_id])
	@response = Response.create(card_id: params[:card_id], game_id: params[:game_id], guess: params[:guess])

	erb :'cards/show'
end

get '/users/:id/profile' do
	@user = User.find_by(id: params[:id])
	erb :'/users/profile'
end

get '/decks/:id' do
	@deck = Deck.find(params[:id])
	@game = Game.new(user_id: current_user.id, deck_id: @deck.id)
	if @game.save

		@card = @game.cards_in_play.sample
		erb :'games/play'
	else
		erb :'decks/index'
	end
end

get '/games/statistics' do
	@game = current_user.games.last
	@responses = @game.responses
	erb :'games/statistics'
end

post '/games/response' do
	response = Response.new(params[:response])
	responses_for_this_card = Response.where(game_id: params[:response][:game_id], card_id: params[:response][:card_id])
	# puts "TESTING!!!!"
	# puts responses_for_this_card
	# puts responses_for_this_card.length
	# puts "TESTING!!!!"
	if responses_for_this_card.length < 1
		response.update(correct_on_first_try: true)
	end
	response.save
	if response.save
		@game = response.game
		@card = @game.cards_in_play.sample
		if @card
			erb :'games/play'
		else
			redirect '/games/statistics'
		end
	else
		@errors = response.errors.full_messages
		erb :'games/play'
	end
end


# get '/users/:user_id/games/:game_id/:deck_id' do # Rewrite
# 	#require_user

# 	erb :'decks/index'
# end

# get '/users/:user_id/games/:game_id/decks/:deck_id/cards' do
# 	#require_user
# 	@deck = Deck.find(params[:deck_id])
# 	erb :'cards/index'
# end





# get '/users/:user_id/games/:game_id' do #Round statistics
# 	#require_user
# end
