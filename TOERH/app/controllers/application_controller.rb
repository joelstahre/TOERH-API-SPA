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

    def authorize_user
        auth_token = request.headers["X-Access-Token"]
        user = User.where(auth_token: auth_token).take


        if user
            return true
        else
            response.status = 401

            errorResponse = {
              status: 401, 
              message: "Unauthorized request.", 
              links: {
                authenticate: "http://#{request.host}/api/v1/authenticate",
                documentation: "http://#{request.host}/docs?autehnticate"
              }
            }

            respond_to do |format|
              format.xml { render xml: errorResponse}
              format.json {render json: errorResponse}
            end
        end

    end

end
