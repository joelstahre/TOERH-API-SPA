class CreateLicences < ActiveRecord::Migration
  def change
    create_table :licences do |t|

        t.string 'licence', :null => false
        t.string 'description', :null => false

        t.timestamps
    end
  end
end
