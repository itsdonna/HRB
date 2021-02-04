class TasksController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:project_id] && @project = Project.find_by_id(params[:post_id])
            @tasks = @project.tasks
        else
            @tasks = Task.alpha
        end
    end

    def new
        if params[:project_id] && @project = Project.find_by_id(params[:post_id])
            @task = @project.task.build
        else
            @task = Task.new
        end
    end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
            redirect_to tasks_path
        else
            render :new
        end
    end

    def show
        @task = Task.find_by(id: params[:id])
    end

    def edit
        @task = Task.find_by(id: params[:id])
    end

    def update
        @task = Task.find_by(id: params[:id])
        if @task.update(task_params)
            redirect_to task_path(@task)
        else
            render :edit
        end
    end

    def destroy
        @task = Task.find_by(params[:id])
        @task.destroy
        redirect_to tasks_path
    end

    # def index
    #     if params[:project_id] && @project = Project.find_by_id[:project_id]
    #         @tasks = @project.tasks
    #     else
    #         @tasks = Task.all
    #     end
    # end

    private

    def task_params
        params.require(:task).permit(:item, :price, :project_id)
    end
end
