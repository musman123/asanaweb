class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
     
      def index
         @users = User.order(:id)
      end
      
      def new
          @user = User.new
          @user.build_picture
      end
      
      def show
          @user = User.find(params[:id])
      end

      def create   
          @user = User.new(user_params)   
          password = @user.password
          password_conformation = @user.password_conformation
          if(password.eql? password_conformation)
              if @user.save   
                session[:user_id] = @user.id 
                redirect_to root_url, notice: 'User successfully created.'  
              else   
                render :new, notice: 'User is not created.'
              end 
          else 
            render :new, notice: 'Password not Matched' 
          end
      end  

      def edit
         @user = User.find(params[:id])
      end

      def update 
          @user = User.find(params[:id])
           if @user.update(user_params)
              password = @user.password
              password_conformation = @user.password_conformation
               if(password.eql? password_conformation)
                   redirect_to @user , notice: 'User successfully updated.'
              else
                   render :edit,  notice: 'User Not Updated Matched.' 
              end
        else 
          render :edit,  notice: 'Password Not Matched.'     
        end
      end

      def selected
          assigned = params[:user]
          tasker = params[:taskid]
          @task = Task.find(tasker.to_i)
          @user = User.find(assigned)
          id = @user.id
          @task.user_id = id
          @task.save
      end

      def destroy
          @user = User.find(params[:id])
          @user.destroy
          redirect_to users_path
      end

      private
        def user_params
          params.require(:user).permit(:task_id, :name, :email, :password, :password_conformation, picture_attributes: [:id, :photo]
          )
        end
end
