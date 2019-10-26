class TasksController < ApplicationController
    before_action :authorized

    def index
        @tasks = Task.all
    end
    
    def new
        @task = Task.new
        @task.assigner_id = current_user.id
        # byebug
    end

    def create

        @task = Task.new(task_params)
        if @task.valid?
            @task.save
            flash[:notice] = "Task successfully created!"
            redirect_to task_path(@task)
        else
            render :new
        end
    end

    def show
        @task = Task.find(params[:id])
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        # byebug
        @task = Task.find(params[:id])
        @task.update(task_params)
        if @task.valid?
            redirect_to task_path(@task)
        else
            render :edit
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path
    end

    private
    
    def task_params
        params.require(:task).permit(:assigner_id, :assignee_id, :title, :category, :priority, :content)
    end
end
