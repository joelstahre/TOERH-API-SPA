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

    def restrict_access
        authenticate_or_request_with_http_token do |token, options|
            ApiKey.exists?(auth_token: token)
        end
    end
end