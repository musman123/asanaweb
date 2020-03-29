class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def new   

  end   

  def create    
   user = User.find_by(password: params[:password],email: params[:email])
    if user
      session[:user_id] = user.id   
      redirect_to root_url, notice: 'Logged in!'   
    else   
      render :new   
    end   
  end   

  def destroy   
    session[:user_id] = nil   
    redirect_to root_url, notice: 'Logged out!'   
  end   

end
