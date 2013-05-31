class TeamsController < ApplicationController
  
  expose :team, :attributes => :team_params

  def show
    authorize! :read, team  
  end

  def edit
    authorize! :manage, team

    if params[:page] == "goals"
      @campaigns = Siepomaga.campaigns
    end
  end

  def update
    authorize! :manage, team

    if team.save
      redirect_to edit_team_path(team), :notice => "Zapisano!"
    else
      render action: 'edit'
    end
  end
  
  private

    def team_params
      params.require(:team).permit(:nip, :name, :budget)
    end

end
