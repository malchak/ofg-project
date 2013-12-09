class CreateGroupsUsersTable < ActiveRecord::Migration
  def change
    create_table :groups_users_tables, :id => false do |t|
    	t.references :group
    	t.references :user
    end
    add_index :groups_users, [:group_id, :user_id]
  end
end
