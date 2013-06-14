class ActivitiesController < ApplicationController
  
  expose(:team)
  expose(:activity) { 
    if params[:id] 
      Activity.find(params[:id])
    else
      current_user.activities.build(activity_params.merge(:team_id => team.id)) 
    end
  }


  def create
    if activity.save
      redirect_to team_path(team), :notice => "Wpis został dodany! Pieniądze zostaną przekazane jeśli inni użytkownicy na niego zagłosują :-)"
    else
      redirect_to team_path(team), :status => :unprocessable_entity
    end
  end

  def upvote
    unless activity.upvotes.where(:user_id => current_user.id).first
      activity.upvotes.create(:user_id => current_user.id)
    end

    render :json => { :success => true }
  end

  private

    def activity_params
      params.require(:activity).permit(:description)
    end

end
