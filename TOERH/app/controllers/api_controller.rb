class ApiController < ApplicationController

    # Get the result
    def get_result(status, message)
        response.status = status
        return result = { response: response.status, message: message}
    end
end