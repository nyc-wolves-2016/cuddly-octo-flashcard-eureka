class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :game
  belongs_to :card
  has_one :user, through: :game
   
  validates :guess, presence: true 

  def correct?
  	self.guess == self.card.answer
  end
end
