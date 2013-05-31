class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  before_action :set_locale
  
  rescue_from CanCan::AccessDenied do |exception|
    if exception.action == :manage
      redirect_to exception.subject, :alert => "Nie masz uprawnień do edycji tego zasobu"
    elsif exception.action == :read
      redirect_to root_path, :alert => "Nie masz uprawnień do oglądania tej strony"
    end

  end

  def set_locale
    I18n.locale = :pl
  end

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
