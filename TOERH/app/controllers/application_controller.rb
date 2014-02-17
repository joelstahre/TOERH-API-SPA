class ApplicationController < ActionController::Base
    
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    # protect_from_forgery with: :exception

    helper_method :current_admin

    private

    def current_admin
        @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
    end

    def require_signin
        if current_admin.nil?
            redirect_to root_path
        end
    end

    ## API Methods

    # Make sure that there is a valid auth_token
    def restrict_access
        authenticate_or_request_with_http_token do |token, options|
            if ApiKey.exists?(auth_token: token)
                if ApiKey.find_by_auth_token(token) 
                    return true
                else
                    return false
                end
            end
        end
    end

    # Format to respond with
    def respond_format(result)
        respond_with do |format|
            format.json {render json: result}
            format.xml {render xml: result}
        end
    end

    # Get the result
    def get_result(status, message, data)
        response.status = status
        return result = { status: response.status, message: message, data: data}
    end
end
