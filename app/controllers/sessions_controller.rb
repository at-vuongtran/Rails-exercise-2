class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.password == params[:session][:password]
      log_in user
      redirect_to user
    else
      # Create an error message.
      debugger
      render 'new'
    end
  end

  def destroy
    def log_out
      log_out
      redirect_to root_url
    end
  end
end