require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module TeamProject
  class Application < Rails::Application
    config.time_zone = 'Warsaw'
    config.i18n.default_locale = :pl
    I18n.locale = :pl
    config.action_mailer.default_url_options = { :host => "#{ENV['RAILS_HOST'] || 'localhost'}:3000" }
    config.lograge.enabled = true
 end
end
