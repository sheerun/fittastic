class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  before_action :set_locale
  
  def set_locale
    I18n.locale = :pl
  end

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
