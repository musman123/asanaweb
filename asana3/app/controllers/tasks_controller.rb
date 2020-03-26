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
        @task.build_picture
      end
      def create   
        @task = Task.new(task_params)   
          if @task.save
            taskId = @task.id
            @task = Task.find(taskId)
            @comments =  @task.comment_ids
            @comments = Comment.where(:id => @comments).pluck(:"body")
           assigner = session[:user_id]
            @user = User.find(assigner)
            assigner = @user.name
            assigned = params[:user]["user_id"]
            assignedto = assigned.to_i
            @user= User.find(assignedto)
            assigned_user = @user.name
            @task.update_attributes(assign_to: assigned_user)
            @task.update_attributes(assigner: assigner)
            @project = params[:project][:project_id]
            @task.project_ids = @project
            @project = Project.where(:id => @project).pluck(:"title")
            @task.update_attribute(:all_project, @project)
            @task.update_attribute(:all_comments, @comments)
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
          assigned = params[:user]["user_id"]
          assignedto = assigned.to_i
          @project = params[:project][:project_id]
          @project = Project.where(:id => @project).pluck(:"title")
          @comments =  @task.comment_ids
          @comments = Comment.where(:id => @comments).pluck(:"body")
          @task.update_attribute(:all_comments, @comments)
          @task.update_attribute(:all_project, @project)
          @task.update_attribute(:assign_to,  assignedto)
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
     
       private
       def task_params
        params.require(:task).permit(:id, :name, :assigner, :task_description, :all_project, :project_name, :project_ids, comments_attributes: [:id, :commenter, :body, :_destroy], picture_attributes: [:id, :photo], users_attributes: [:id, :name])
      end
       
end
