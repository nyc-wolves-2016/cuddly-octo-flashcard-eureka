class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :game
  belongs_to :card
  has_many :users, through: :games
   
  validates :guess, presence: true 

end
