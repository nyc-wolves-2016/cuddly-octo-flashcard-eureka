class CreateGames < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.integer :deck_id null: false
  		t.integer :user_id null: false

  		t.timestamps
  	end
  end
end
