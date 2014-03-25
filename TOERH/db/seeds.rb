# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 #ActiveRecord::Base.establish_connection
  #  ActiveRecord::Base.connection.tables.each do |table|

      # SQLite
    #    ActiveRecord::Base.connection.execute("DELETE FROM #{table}") unless table == "schema_migrations"
   #     ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'")


    #end
    #ActiveRecord::Base.connection.execute("VACUUM")

User.create(name: 'John Doe', provider: 'Github', uid: '123456', auth_token: '31231', token_expires: '123456')


ResourceType.create(resource_type: 'Video')
ResourceType.create(resource_type: 'pdf')
ResourceType.create(resource_type: 'Website')

Licence.create(licence: 'MIT', description: 'Lorem ipsum')
Licence.create(licence: 'CC', description: 'Lorem ipsum')

t = Tag.create(tag: 'Biology')
t2 = Tag.create(tag: 'Science')
t3 = Tag.create(tag: 'Webb')
t4 = Tag.create(tag: 'Funny')


r =Resource.create(user_id: 1, resource_type_id: 3, licence_id: 1, title: "Resurs 1", desciption: "Bacon ipsum dolor sit amet kevin fatback pastrami pork", url: "http://www.joelstahre.com")
r2 =Resource.create(user_id: 1, resource_type_id: 2, licence_id: 1, title: "Resurs 2", desciption: "Pig fatback pork loin, strip steak pork chop kevin", url: "http://www.joelstahre.com")
r3 =Resource.create(user_id: 1, resource_type_id: 1, licence_id: 2, title: "Resurs 3", desciption: "Cow t-bone tri-tip pancetta tenderloin. ank ham hock tongue pig.", url: "http://www.joelstahre.com")
r4 =Resource.create(user_id: 2, resource_type_id: 2, licence_id: 1, title: "Resurs 4", desciption: "Rump ham hock beef t-bone, sausage doner kielbas", url: "http://www.joelstahre.com")
r5 =Resource.create(user_id: 2, resource_type_id: 3, licence_id: 2, title: "Resurs 5", desciption: "Drumstick fatback pork jerky, turducken venison beef .", url: "http://www.joelstahre.com")
r6 =Resource.create(user_id: 1, resource_type_id: 1, licence_id: 1, title: "Resurs 6", desciption: "Bacon ipsum dolor sit amet kevin fatback pastrami .", url: "http://www.joelstahre.com")


r.tags << t
r2.tags << t3
r2.tags << t3
r3.tags << t2
r4.tags << t2
r5.tags << t3
r6.tags << t4

Admin.create(first_name: 'admin', last_name: 'admin', admin_email: 'admin@admin.se', username: 'admin', password: 'password', password_confirmation: 'password')