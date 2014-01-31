class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|

    	t.integer "auth_token", :default => 0
      	
      	t.timestamps
    end
  end
end
