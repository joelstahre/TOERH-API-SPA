class ApiController < ApplicationController

    # Get the result
    def get_result(status, message)
        response.status = status
        
        @response = OpenStruct.new
        @response.code = response.status
        @response.message = message

        return @response
    end
end