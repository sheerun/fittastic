class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  expose :user

  def home
    if current_user.present?
      if can?(:manage, current_user.team) && !current_user.team.valid?
        redirect_to edit_team_path(current_user.team)
      elsif current_user.team.valid?
        redirect_to team_path(current_user.team)
      else
        flash.now[:alert] = "Administrator jeszcze nie skonfigurował Twojego zespołu"
      end
    end
  end

  def activity
  end

  def dashboard
  end
end
