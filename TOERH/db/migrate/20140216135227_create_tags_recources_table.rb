class CreateTagsRecourcesTable < ActiveRecord::Migration

    def up
        create_table :tags_resources, :id => false do |t|
            t.integer "tag_id"
            t.integer "resource_id"
        end

        add_index :tags_resources, ["tag_id", "resource_id"]

    end

    def down
        drop_table :tags_resources
    end

end
