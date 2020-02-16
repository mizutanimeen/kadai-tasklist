class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in, only: [:index, :show, :new, :edit]
  
  def index
    @tasks = current_user.tasks.order(id: :desc).page(params[:page])
  end
  
  def show 
  end
  
  def new 
    @task = current_user.tasks.build
  end
  
  def create
    @task = current_user.tasks.build(task_params)
     
     if @task.save
       flash[:success] = "新しいタスクを作成しました"
       redirect_to @task
     else
       flash.now[:danger] = "タスクを作成できませんでした"
       render :new
     end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = "タスクの内容を変更しました"
      redirect_to @task
    else
      flash[:danger] = "タスクの内容を変更できませんでした"
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = "タスクを削除しました"
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
