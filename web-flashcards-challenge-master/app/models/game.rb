class Game < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :responses
  has_many :cards, through: :deck

  def correct_answers
  	self.responses.count { |response| response.correct? }
  end

  def total_guesses
  	self.responses.count
  end

  def cards_in_play
  	self.responses.reject { |response| response.correct? }.map { |response| response.card }
	end
end