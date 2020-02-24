class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def show
    @user = User.includes(:teams_users, :teams).find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
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
    user.find(params[:id]).destroy!
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :gender, :address, :phone_number, :comments_count)
    end
end
