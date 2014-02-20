object false

extends 'API/shared/response'
 
child @t do
    attributes :id, :tag, :created_at, :updated_at 

    node(:links) do |m|
        { 
            "self_link" => "http://#{request.host_with_port}#{api_v1_tag_path(m.id)}"
        }
    end
end

