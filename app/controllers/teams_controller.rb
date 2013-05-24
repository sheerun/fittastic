class TeamsController < ApplicationController
  
  expose :team, :attributes => :team_params

  def update
    if team.save
      redirect_to edit_team_path(team), :notice => "Zapisano!"
    else
      render action: 'edit'
    end
  end
  
  def show

  end

  private

    def team_params
      params.require(:team).permit(:nip, :name, :budget)
    end

end
