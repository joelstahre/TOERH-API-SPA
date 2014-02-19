object false

extends 'API/licences/response'
 
child @l do
    attributes :id, :licence, :created_at, :updated_at

    node(:links) do |m|
        { 
            "self_link" => "http://#{request.host_with_port}#{api_v1_licence_path(m.id)}"
        }
    end
end

