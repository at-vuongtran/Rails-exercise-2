class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to current_user
    end 
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.password == params[:session][:password]
      log_in user
      redirect_to user
    else
      flash[:notice] = "Account or password incorrect!"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end    
end
