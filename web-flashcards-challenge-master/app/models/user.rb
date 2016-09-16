class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :games
  has_many :responses, through: :games 
  has_many :played_decks, through: :games, foreign_key: :deck_id

  validates :username, :email, presence: true 
  validates :username, :email, uniqueness: true 

  has_secure_password

end
