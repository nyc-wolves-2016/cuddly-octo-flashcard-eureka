get '/decks' do
	erb :'/decks/index'
end

get '/decks/:deck_id/cards' do
	@deck = Deck.find(params[:deck_id])
	erb :'cards/index'
end 	
