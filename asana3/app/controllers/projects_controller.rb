class ProjectsController < ApplicationController
  
  def index
        @projects = Project.order(:id)
      end

      def new
        @project = Project.new
        @project.build_picture
      end

      def show
        @project = Project.find(params[:id])
      end

      def create
         @project = Project.new(project_params)
        if @project.save
         redirect_to @project , notice: 'Project is created.'
        else
        render :new, notice: 'Project not created.'
        end
      end

      def edit
        @project = Project.find(params[:id])   
      end

      def update 
        @project = Project.find(params[:id])
        if @project.update(project_params)
          redirect_to @project, notice: 'Project is updated.'
        else
          render :edit, notice: 'Project not updated.'
        end
      end

      def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path, notice: 'Project Is Destroyed.'
      end
    
      def project_params
        params.require(:project).permit(:task_id, :title, :description, :department, picture_attributes: [:id, :photo])
      end
end
