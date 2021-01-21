class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def index
        @users = User.all
    end

    def show
        @user = User.find(current_user)
    end
    
end
