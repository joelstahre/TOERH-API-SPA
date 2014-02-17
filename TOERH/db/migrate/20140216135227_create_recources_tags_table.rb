class CreateRecourcesTagsTable < ActiveRecord::Migration

    def up
        create_table :resources_tags, :id => false do |t|
            t.integer "tag_id"
            t.integer "resource_id"
        end

        add_index :resources_tags, ["tag_id", "resource_id"]

    end

    def down
        drop_table :resources_tags
    end

end
