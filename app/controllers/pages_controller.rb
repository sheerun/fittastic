class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  expose :user

  def home

  end

  def activity
  end

  def dashboard
  end

  def dashboard_goals
    @wii = Siepomaga.campaigns()
  end
end
