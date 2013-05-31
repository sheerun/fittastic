class TeamsController < ApplicationController
  
  expose :team, :attributes => :team_params
  expose(:activity) { Activity.new }

  def show
    authorize! :read, team  

    if !team.valid?
      if can? :manage, team
        redirect_to edit_team_path(team)
      else
        redirect_to root_path, :alert => "Administrator tego zespołu jeszcze go nie skonfigurował"
      end
    end
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
      redirect_to edit_team_path(team), :notice => "Zapisano! Możesz teraz dodać nowych pracowników w zakładce 'Pracownicy'"
    else
      render action: 'edit'
    end
  end
  
  private

    def team_params
      params.require(:team).permit(:nip, :name, :budget)
    end

end
