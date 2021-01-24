class ProjectsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @project = Project.new
    end

    def index
        @projects = Project.all
    end
end
