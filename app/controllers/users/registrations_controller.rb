class Users::RegistrationsController < Devise::SessionsController

  expose(:team){ Team.where(:token => params[:t]).first }

  def new
    cookies[:token] = params[:t] if params[:t].present?
    render 'pages/home'
  end

end
