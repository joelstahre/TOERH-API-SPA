class AddNewColumnsForUsersTable < ActiveRecord::Migration
    def up
        change_table(:users) do |t|
            t.column :name, :string
            t.column :provider, :string
            t.column :uid, :string
            t.column :auth_token, :string
            t.column :token_expires, :string
        end
    end

    def down
        t.remove :name, :provider, :uid, :auth_token, :token_expires
    end
end
