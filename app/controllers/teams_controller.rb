class TeamsController < ApplicationController
  def index
    if logged_in?
      @teams = Team.search(params[:search]).paginate(page: params[:page], per_page: 4)
    else
      redirect_to login_path
    end
  end

  def show
    if logged_in?
      begin
        @team = Team.includes(:users).find(params[:id])
      rescue => exception
        @team = nil
      end
    else
      redirect_to login_path
    end
  end

  def new
    if logged_in?
      @team = Team.new
    else
      redirect_to login_path
    end
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:notice] = 'Created a team successfuly'
      redirect_to team_path(@team)
    else
      render 'new'
    end
  end

  def edit
    if logged_in?
      @team = Team.find(params[:id])
    else
      redirect_to login_path
    end
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      # Handle a successful update.
      flash[:notice] = 'Update success'
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    begin
      Team.find(params[:id]).destroy!
      flash[:notice] = "You have just delete a team"
      redirect_to teams_path
    rescue => exception
      flash[:notice] = "Can not delete team"
      redirect_to teams_path
    end
  end
  private

    def team_params
      params.require(:team).permit(:name, :leader_id)
    end
end
