class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in? #dont have to repeat logic in other views

    private
    def current_user
      @current_user ||= User.find_by_id(session[:user])
    end

     def logged_in?
       current_user != nil
     end

     def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
     end
end
