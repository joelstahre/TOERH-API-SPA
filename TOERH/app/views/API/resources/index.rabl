collection false

extends 'API/resources/base'

node(:links, :if => lambda { |m| m == true }) do |m|
    { 
        "prev_set_link" => "http://#{request.host_with_port}#{api_v1_resources_path}?#{@param}limit=#{@limit}&offset=#{@offset}",
        "next_set_link" => "http://#{request.host_with_port}#{api_v1_resources_path}?#{@param}limit=#{@limit}&offset=#{@offset = @offset.to_i + @limit.to_i}"
    }
end

