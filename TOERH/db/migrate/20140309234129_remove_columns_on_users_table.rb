class RemoveColumnsOnUsersTable < ActiveRecord::Migration
    def up
        remove_column :users, :first_name
        remove_column :users, :last_name
        remove_column :users, :email
    end

    def down
        add_column :users, :first_name, :string
        add_column :users, :last_name, :string
        add_column :users, :email, :string
    end
end
