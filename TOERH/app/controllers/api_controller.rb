class ApiController < ApplicationController

    # Get the result
    def get_result(status, message, count = nil, limit = nil, offset = nil)
        response.status = status
        
        @response = OpenStruct.new
        @response.code = response.status
        @response.message = message

        if count != nil 
            @response.count = count
        end

        if limit || offset != nil
            @response.limit = limit
            @response.offset = offset 
        end

        return @response
    end
end