class CreatePagesUsersJoins < ActiveRecord::Migration
  def change
    create_table :pages_users, :id => false do |t|
		t.integer "page_id"
		t.integer "user_id"		
    end
	add_index :pages_users, ["page_id","user_id"] 
  end
  
  def down
	drop_table :pages_users
  end
end
