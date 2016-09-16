class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :game
  belongs_to :card
  belongs_to :user, through: :games
   
  validates :guess, presence: true 

end
