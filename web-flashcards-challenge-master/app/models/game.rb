class Game < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :responses

  has_many :cards, through: :deck
  # scope :answered_cards, -> { joins(responses: :card).where(correct?: true) }


  def correct_guesses
 	self.responses.count { |response| response.correct? }
  end

  def total_guesses
  	self.responses.count
  end

  def cards_in_play
  	self.cards.select do |card|
  		card.responses.none? { |response| response.correct? }
  	end
  end


end
# !card.responses ||