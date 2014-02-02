class CreateAdmins < ActiveRecord::Migration
  	def change
    	create_table :admins do |t|

    		t.string 'first_name', :null => false
    		t.string 'last_name', :null => false
    		t.string 'admin_email', :null => false
    		t.string 'username', :null => false
    		t.string 'password_digest', :null => false 

      		t.timestamps
    	end
  	end
end
