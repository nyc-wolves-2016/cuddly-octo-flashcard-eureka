class CreateResponses < ActiveRecord::Migration
  def change
  	create_table :responses do |t|
  		t.integer :card_id, null: false
  		t.integer :game_id, null: false
  		t.string :guess, null: false

  		t.timestamps
  	end
  end
end
