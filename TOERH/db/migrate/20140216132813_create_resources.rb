class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
        t.references :user
        t.references :resource_type
        t.references :licence

        t.string 'title', :null => false
        t.string 'desciption'
        t.string 'url', :null => false

        t.timestamps
    end
  end
end
