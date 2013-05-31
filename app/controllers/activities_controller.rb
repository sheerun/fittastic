class ActivitiesController < ApplicationController
  
  expose(:team)
  expose(:activity) { current_user.activities.build(activity_params.merge(:team_id => team.id)) }

  def create
    if activity.save
      redirect_to team_path(team), :notice => "Wpis został dodany! Pieniądze zostaną przekazane jeśli inni użytkownicy na niego zagłosują :-)"
    else
      redirect_to team_path(team), :status => :unprocessable_entity
    end
  end
  
  private

    def activity_params
      params.require(:activity).permit(:description)
    end

end
