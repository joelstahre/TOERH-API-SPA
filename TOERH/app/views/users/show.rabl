object @u

attributes :user_id, :first_name, :last_name, :email

child :resource do 
    attributes :id, :title, :desciption, :url, :created_at, :updated_at
end