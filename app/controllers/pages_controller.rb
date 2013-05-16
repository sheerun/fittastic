class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def home
  end

  def activity
  end
end
