object false

extends 'API/resources/base'

node(:links, :if => lambda { |m| m == true }) do |m|
    { 
      "user_link" => "http://#{request.host_with_port}#{api_v1_user_path(@r.user.id)}"
    }
end