class SessionsController < ApplicationController

    def home
        
    end

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:error] = "Email or password incorrect. Please try again."
            redirect_to '/login'
        end
    end

    def destroy 
        session.delete(:user_id)
        redirect_to root_path
    end

    def googleAuth
        @user = User.create_by_google_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end
    
    private

    def auth
        request.env['omniauth.auth']
    end
end