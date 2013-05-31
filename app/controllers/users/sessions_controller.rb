class Users::SessionsController < Devise::SessionsController

  expose(:team){ Team.where(:token => params[:token]).first }

  def new
    render 'pages/home'
  end

end
