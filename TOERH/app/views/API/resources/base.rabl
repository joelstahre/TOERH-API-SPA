extends 'API/shared/response'

child @r do
    attributes :id, :title, :desciption, :url, :created_at, :updated_at
    node(:resource_type) do |m|
        { 
          "id" => m.resource_type.id,
          "resource_type" => m.resource_type.resource_type
        }
    end

    node(:licence) do |m|
        { 
          "id" => m.licence.id,
          "licence" => m.licence.licence,
          "desciption" => m.licence.description
        }
    end

    node(:tags) do |m|
      m.tags do |tag| 
      
      end
    end

    node(:user) do |m|
        { 
          "id" => m.user_id,
          "test" => m
        }
    end
end