class TeamsController < ApplicationController
  def index
    if logged_in?
      @teams = Team.paginate(page: params[:page], per_page: 2)
    else
      redirect_to login_path
    end
  end

  def show
    if logged_in?
      @team = Team.includes(:users).find(params[:id])
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
      render @team
    else
      render 'edit'
    end
  end

  def destroy
    Team.find(params[:id]).destroy!
  end
  private

    def team_params
      params.require(:team).permit(:name, :leader_id)
    end
end
