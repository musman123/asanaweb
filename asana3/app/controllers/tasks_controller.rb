class TasksController < ApplicationController
 
 def index
    @tasks = Task.order(:id)
  end
  def show
    @task = Task.find(params[:id])
  end
    def new
        @task = Task.new
        @task.comments.build
        @task.projects.build
        @task.build_picture
      end
      def create   
        @task = Task.new(task_params)   
          if @task.save
            assigner = session[:user_id]
            @user = User.find(assigner)
            assigner = @user.name   
            @task.update_attribute(:assigner, assigner)
            @project = params[:project][:project_id]
            @task.project_ids = @project
            redirect_to @task
          else 
            flash[:error] = "Project has not been created due to some error"
            render 'new'
          end
        end
     
      def edit
        @task = Task.find(params[:id])
      end
      def update 
        @task = Task.find(params[:id])
        if @task.update(task_params)
          @project = params[:project][:project_id]
          @task.project_ids = @project
          redirect_to @task
        else
          render 'edit'
        end
      end
      
      def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path
      end
       def task_params
        params.require(:task).permit(:id, :name, :task_description, :assigner, :assign_to, :all_project, :project_name, :project_ids,
        projects_attributes: [:id, :title, :description],
        comments_attributes: [:id, :commenter, :body, :_destroy],
        picture_attributes: [:id, :photo],
        user_attributes: [:id, :name])
      end
       
end
