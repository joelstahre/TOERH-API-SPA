object false

extends 'API/users/response'
 
child @u do
  attributes :id, :first_name, :last_name, :email, :created_at, :updated_at 

    node(:links) do |m|
        { 
            "self_link" => "http://#{request.host_with_port}#{api_v1_user_path(m.id)}"
        }
    end
  
end



