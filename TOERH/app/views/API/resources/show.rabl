object false

extends 'API/resources/response'
 
child @r do
    attributes :id, :title, :desciption, :url, :created_at, :updated_at
    node(:resource_type) do |m|
        { 
          "id" => m.id,
          "resource_type" => m.resource_type.resource_type
        }
    end

    node(:licence) do |m|
        { 
          "id" => m.id,
          "licence" => m.licence.licence,
          "desciption" => m.desciption
        }
    end

    node(:tags) do |m|
      m.tags do |tag| 

     
      end
    end

    node(:user) do |m|
        { 
          "id" => m.user.id,
          "first_name" => m.user.first_name,
          "last_name" => m.user.last_name,
          "email" => m.user.email
        }
    end

    node(:links) do |m|
        { 
          "self_link" => "http://#{request.host_with_port}#{api_v1_resource_path(m.id)}",
          "user_link" => "http://#{request.host_with_port}#{api_v1_user_path(m.user.id)}"
        }
    end
end


