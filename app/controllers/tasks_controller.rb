class TasksController < ApplicationController

attr_accessor :completed
before_filter :find_list

def create
	@task = @list.tasks.new(task_params)
	if @task.save
		flash[:notice] = "Task created"
		redirect_to list_path(@list)
	else
		flash[:error] = "Could not add task at this time."
		redirect_to list_url(@list)
	end
end

def complete
	@task = @list.tasks.find(params[:id])
	@task.completed = true
	@task.save
	redirect_to list_path(@list)
end
end


		private

	def task_params
		params.require(:task).permit(:description, :list_id, :completed)
	end

	def find_list
		@list = List.find(params[:list_id])
	end