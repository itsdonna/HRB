class TasksController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def new
       @project = Project.find(params["project_id"])
       @task = @project.tasks.build
    end

    def index
        @project = Project.find(params["project_id"])
        @task = @project.tasks
    end

    def create
        @task = current_user.tasks.build(task_params)
        @task.user = current_user
        if @task.save
            redirect_to tasks_path(@task)
        else
            render :new
        end
    end

    private

    def task_params
        params.require(:task).permit(:item, :price, :task_id, :project_id, project_attributes:[:name])
    end
end
