class TasksController < ApplicationController

    def new
       @tasks = Task.new
       @tasks.build_project
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to task_path(@task)
        else
            render :new
        end
    end

    private

    def task_params
        params.require(:task).permit(:item, :price, :task_id, :project_id, project_attributes:[:name])
    end
end
