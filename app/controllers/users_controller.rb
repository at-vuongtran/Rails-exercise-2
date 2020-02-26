class UsersController < ApplicationController
  GENDER = { 'male' => 1, 'female' => 2, 'unknown' => 3}

  def index
    if logged_in?
      @users = User.search(params[:search]).paginate(page: params[:page], per_page: 5)
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
    tmp = user_params
    tmp[:gender] = GENDER[tmp[:gender]]
    @user = User.new(tmp)
    if @user.save
      log_in @user
      flash[:notice] = "Welcome to my website"
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
    tmp = user_params
    tmp[:gender] = GENDER[tmp[:gender]]
    if @user.update_attributes(tmp)
      flash[:notice] = "Update success!"
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
      params.require(:user).permit(:name, :email, :gender, :address, :phone_number, :comments_count, :search)
    end
end
