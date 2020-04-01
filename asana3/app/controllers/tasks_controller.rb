class TasksController < ApplicationController

   def index
     @tasks = Task.order(:id)
   end

   def show
     @task = Task.find(params[:id])
   end

   def new
     @task = Task.new
     @img_conn = @task.comments.build
     @task.projects.build
     @task.build_picture
     @img_conn.build_picture 
   end

   def edit
     @task = Task.find(params[:id])
   end

   def create
     @task = Task.new(task_params)
       debugger
       if @task.save
          assigner = session[:user_id]
          @user = User.find(assigner)
          assigner = @user.name
          @task.update_attribute(:assigner, assigner)
          redirect_to @task, notice: 'Task is created.'
       else
          render :new, notice: 'Task is not Created.'
       end

   end

   def update
     @task = Task.find(params[:id])

       if @task.update(task_params)
           redirect_to @task, notice: 'Task  Successfully updated.'
       else
           render :edit, notice: 'Task is not Updated.'
       end
         
   end

   def destroy
     @task = Task.find(params[:id])
     @task.destroy
     redirect_to tasks_path notice: 'Task successfully Destroyed .'
   end

   def task_params
     params.require(:task).permit(:id, :name, :task_description, :assigner, :assign_to, :user_id,
     projects_attributes: [:id, :title, :description],
     picture_attributes: [:id, :photo],
     user_attributes: [:id, :email],
     comments_attributes: [:id, :commenter, :body, :_destroy, picture_attributes: [:id, :photo]],
     project_ids: [])
   end

end
