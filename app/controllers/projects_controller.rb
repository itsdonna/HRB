class ProjectsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_project, only: [:show, :edit]

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @project = @user.projects.build
        else
            @project = Project.new
        end
    end

    def create 
        @project = Project.new(project_params)
        if @project.save
            redirect_to projects_path
        else
            render :new
        end
    end

    def index
        @project = Project.alpha
    end

    def edit 
        # @project = Project.find_by_id(params[:id])
    end

    def update
        @project = Project.find_by(id: params[:id])
        if @project.update(project_params)
            redirect_to project_path
        else
            render :edit
        end
    end

    def show
        # @project = Project.find_by_id(params[:id])
        redirect_to project_path if !@project
    end

    def destroy
        @project.destroy
        redirect_to project_path
    end

    private
    def set_project
        @project = Project.find_by_id(params[:id])
    end

    def project_params
        params.require(:project).permit(:name, :contractor, :description, :date)
    end
end
