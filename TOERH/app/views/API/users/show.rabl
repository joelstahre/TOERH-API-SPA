object false

extends 'API/users/base'

node(:links, :if => lambda { |m| m == true }) do |m|
    { 
        "self_link" => "http://#{request.host_with_port}#{api_v1_user_path(@u)}",
        "user_resources_link" => "http://#{request.host_with_port}#{api_v1_user_resources_path(@u.id)}"
    }
end



