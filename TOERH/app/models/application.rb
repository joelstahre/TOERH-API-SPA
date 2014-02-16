class Application < ActiveRecord::Base
  belongs_to :api_key

  	validates :app_name,
              :presence => {:message => "Application name can not be empty!"},
              :length => {:minimum => 3, :message => "Must be at least 3 characters long!"}
  
  	validates :app_desc,
              :presence => {:message => "Application description can not be empty!"},
              :length => {:minimum => 10, :message => "Must be at least 10 characters long!"}
  
  	validates :owner_name,
              :presence => {:message => "Owner name can not be emtyp!"},
              :length => {:minimum => 4, :message => "Must be at least 4 characters long!"}
  
  	validates :contact_mail,
              :presence => {:message => "Mail can not be emtyp!"},
              :uniqueness => {:message => "This email is already registerd."}
end
