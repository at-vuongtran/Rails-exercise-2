class TeamsController < ApplicationController
  def index
    @teams = Team.all
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

  def team_params
    params.require(:team).permit(:name, :leader_id)
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update; end

  def destroy; end
end