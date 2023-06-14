class TasksController < ApplicationController

  def edit


    @list = current_user.dolists.find(params[:dolist_id])
    if current_user != @list.user
      redirect_to root_path
    else
      @task = @list.tasks.find(params[:id])
    end

  end

  def update
    @list = current_user.dolists.find(params[:dolist_id])
    @task = @list.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to dolist_path(@list)

    else
      render :edit, status: :unprocessable_entity

    end

  end


  def create
    @list = current_user.dolists.find(params[:dolist_id])
    @task = @list.tasks.create(task_params)
    redirect_to dolist_path(@list)
  end

  def destroy

    @list = Dolist.find(params[:dolist_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to dolist_path(@list), status: :see_other


  end

  private
  def task_params

    params.require(:task).permit(:activity, :status)

  end

end
