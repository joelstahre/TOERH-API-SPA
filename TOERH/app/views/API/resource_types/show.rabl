object false

extends 'API/shared/response'
 
child @rt do
  attributes :id, :resource_type, :created_at, :updated_at 

    node(:links) do |m|
        { 
            "self_link" => "http://#{request.host_with_port}#{api_v1_resource_type_path(m.id)}"
        }
    end
  
end

