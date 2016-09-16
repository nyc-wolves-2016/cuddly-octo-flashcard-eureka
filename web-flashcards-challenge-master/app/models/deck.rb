class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :cards
  has_many :games 
  has_many :users, through: :games
  
  validates :name, presence: true 

  def card_count
  	self.cards.count
  end
end
