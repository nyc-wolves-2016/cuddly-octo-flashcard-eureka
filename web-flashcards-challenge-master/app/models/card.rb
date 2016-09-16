class Card < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :deck 
  has_many :responses
  has_many :games, through: :responses
  
  validates :question, :answer, presence: true

end
