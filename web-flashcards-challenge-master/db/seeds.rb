first_deck = Deck.create!(name: "BS")

cards = [
	{ question: "Is a whale a mammal?",
		answer: "Yes",
		deck_id: first_deck.id
	},
	{ question: "Is the pope a catholic?",
		answer: "Yes",
		deck_id: first_deck.id
	},
	{ question: "Is Manhattan a borough of NYC?",
		answer: "Yes",
		deck_id: first_deck.id
	},
	{ question: "Is a wolf a sheep?",
		answer: "No",
		deck_id: first_deck.id
	}
]

Card.create!(cards)
