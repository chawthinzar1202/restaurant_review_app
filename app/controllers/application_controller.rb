class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper 

    before_action :require_login, only: [:user, :session, :review, :restaurant] 

    private
    def require_login 
        unless logged_in?
        flash[:alert] = "Please log in to access this page."
        redirect_to login_url
        end
    end

end
