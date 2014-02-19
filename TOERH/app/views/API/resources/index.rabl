collection false

extends 'API/resources/base'

node(:links) do |m|
    { 
        "prev_set_link" => "http://#{request.host_with_port}#{api_v1_resources_path}?#{@param}limit=#{@limit}&offset=#{@offset}",
        "next_set_link" => "http://#{request.host_with_port}#{api_v1_resources_path}?#{@param}limit=#{@limit}&offset=#{@offset = @offset.to_i + @limit.to_i}"
    }
end

