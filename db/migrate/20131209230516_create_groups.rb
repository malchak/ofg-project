class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.string :group_name
    	t.string :city
    	t.string :state
      t.timestamps
    end
  end
end
