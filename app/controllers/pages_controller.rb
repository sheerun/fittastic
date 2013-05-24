class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  expose :user

  def home
    if current_user.present?
      redirect_to edit_team_path(current_user.team)
    end
  end

  def activity
  end

  def dashboard
  end
end
