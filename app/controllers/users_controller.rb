class UsersController < ApplicationController
  def index
    if logged_in?
      @users = User.paginate(page: params[:page], per_page: 2)
    else
      redirect_to login_path
    end
  end

  def show
    if logged_in?
      begin
        @user = User.includes(:teams_users, :teams).find(params[:id])
      rescue
        @user = nil
      end
    else
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to login_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy!
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :gender, :address, :phone_number, :comments_count)
    end
end
