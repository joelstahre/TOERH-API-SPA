# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 ActiveRecord::Base.establish_connection
    ActiveRecord::Base.connection.tables.each do |table|

      # SQLite
        ActiveRecord::Base.connection.execute("DELETE FROM #{table}") unless table == "schema_migrations"
        ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'")


    end
    ActiveRecord::Base.connection.execute("VACUUM")

ApiKey.new

User.create(first_name: 'John', last_name: 'Doe', email: 'john@doe.com')
ResourceType.create(resource_type: 'Video')
Licence.create(licence: 'MIT', description: 'Lorem ipsum')
t = Tag.create(tag: 'En tag')

r =Resource.create(user_id: 1, resource_type_id: 1, licence_id: 1, title: "Resurs titel", desciption: "en beskrivning", url: "http://www.joelstahre.com")

r.tags << t