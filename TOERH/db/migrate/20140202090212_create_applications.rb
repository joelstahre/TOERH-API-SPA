class CreateApplications < ActiveRecord::Migration
  def change
    	create_table :applications do |t|
    		  t.references :api_key
    	
    		  t.string "contact_mail", :null => false
      		t.string "app_name", :limit => 20, :null => false
      		t.text "app_desc", :null => false
      		t.string "owner_name", :limit => 20, :null => false

      		t.timestamps
    	end
  	end
end
