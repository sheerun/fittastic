class TeamsController < ApplicationController
  
  expose :team, :attributes => :team_params

  def show
    
  end

  def update
    if team.save
      redirect_to edit_team_path(team), :notice => "Zapisano!"
    else
      render action: 'edit'
    end
  end
  
  def edit
    if params[:page] == "goal"
      @campaigns = Siepomaga.campaigns
    end
  end

  private

    def team_params
      params.require(:team).permit(:nip, :name, :budget)
    end

end
