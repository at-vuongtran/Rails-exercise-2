class TeamsController < ApplicationController
  def index
    @teams = Team.paginate(page: params[:page], per_page: 2)
  end

  def show
    @team = Team.includes(:users).find(params[:id])
  end

  def new
    @team = Team.new
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
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      # Handle a successful update.
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
