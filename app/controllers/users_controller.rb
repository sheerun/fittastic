class UsersController < ApplicationController
  
  expose :user, :attributes => :user_params

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

  def destroy
    authorize! :manage, user

    user.update_attribute(:team_id, nil)

    redirect_to edit_team_path(team, :page => "employees"), :alert => "Pracownik został usunięty z teamu"
  end
  
  private

    def user_params
      params.require(:user).permit()
    end

end
