class SessionsController < ApplicationController
    

    def home
        
    end

    def create
        user = User.find_by(email: params[:user][:email])
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
        @user = User.from_omniauth(auth)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            redirect_to '/signup'
        end

    end

    
    private

    def auth
        request.env['omniauth.auth']
    end
end