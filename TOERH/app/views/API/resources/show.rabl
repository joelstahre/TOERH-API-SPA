object false

extends 'API/resources/base'

node(:links) do |m|
    { 
      "self_link" => "http://#{request.host_with_port}#{api_v1_resource_path(@r)}",
      "user_link" => "http://#{request.host_with_port}#{api_v1_user_path(@r.user.id)}"
    }
end


