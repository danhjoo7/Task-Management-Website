class TasksController < ApplicationController
    before_action :authorized

    def index
        @tasks = Task.all
    end
    
    def new
        @task = Task.new
    end

    def create
        byebug
        @task = Task.new(task_params(:assignee_id, :title, :category, :priority, :content))
        if @task.valid?
            @task.save
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
        @task.update(task_params(:title, :category, :status, :priority, :description))
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
    
    def task_params(*args)
        params.require(:task).permit(*args)
    end
end
