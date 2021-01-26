class ProjectsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_project, only: [:show, :edit, :update]

    
    def new
        @project = Project.new
    end
    
    def create
        @project = current_user.projects.build(project_params)
        if @project.save
            redirect_to project_path(@project)
        else
            render :new
        end
    end
  
    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @projects = @user.projects
        else
            @projects = Project.order_by_name
        end
        # @projects = Project.order('name ASC').all
    end

    def update
        if @project.update(project_params)
            redirect_to project_path
        else
            render :edit
        end
    end

    def destroy
        @project.destroy
        redirect_to projects_path
    end

    private
    def set_project
        @project = Project.find_by_id(params[:id])
    end

    def project_params
        params.require(:project).permit(:name, :contractor, :description, :date)
    end
end
