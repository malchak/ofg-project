class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
    	t.integer :score
    	t.integer :winnings
    	
    	t.references :user
    	t.references :course
      t.timestamps
    end
  end
end
