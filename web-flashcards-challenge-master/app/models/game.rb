class Game < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :responses
  has_many :cards, through: :responses

  def correct_answers
  	self.responses.count { |response| response.correct? }
  end

  def total_guesses
  	self.responses.count
  end


end
