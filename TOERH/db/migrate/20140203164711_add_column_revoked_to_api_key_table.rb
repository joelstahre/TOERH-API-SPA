class AddColumnRevokedToApiKeyTable < ActiveRecord::Migration
  def change
  	add_column :api_keys, :revoked, :boolean, :null => false, :default => false
  end
end
