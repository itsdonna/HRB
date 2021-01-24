class ProjectsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_project, only:[:show, :edit, :update]

    def new
        @project = Project.new
    end
    
    def create
        @project = current_user.projects.build(project_params)
        if @project.save
            redirect_to projects_path
        else
            render :new
        end
    end
    
    def index
        @projects = Project.order('name ASC').all
    end

    private
    def set_project
        @project = Project.find_by_id(params[:id])
    end

    def project_params
        params.require(:project).permit(:name, :contractor, :description, :date)
    end
end
