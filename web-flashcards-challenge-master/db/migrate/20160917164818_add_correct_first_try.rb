class AddCorrectFirstTry < ActiveRecord::Migration
  def change
    add_column :responses, :correct_on_first_try, :boolean, default: false
  end
end
