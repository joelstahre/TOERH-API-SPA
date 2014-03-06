collection false

extends 'API/resources/base'

node(:links) do |m|
    { 
        "prev_set_link" => @prev,
        "next_set_link" => @next
    }
end

