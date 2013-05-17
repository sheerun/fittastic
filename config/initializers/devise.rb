# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.mailer_sender = "kontakt@team-project.dev"

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10

  # Setup a pepper to generate the encrypted password.
  config.pepper = "02f7c5f8ab9d70eb997742b1126c70e0c98bb3803190c1bee9d66872f1847e1eb70cf4db54152da250fccfe6dc82069befcbb4e7173f298a42c699d736756c8e"

  # If true, requires any email changes to be confirmed (exactly the same way as
  # initial account confirmation) to be applied. Requires additional unconfirmed_email
  # db field (see migrations). Until confirmed new email is stored in
  # unconfirmed email column, and copied to email column on successful confirmation.
  config.reconfirmable = true

  config.password_length = 8..128

  config.reset_password_within = 6.hours

  config.default_scope = :user

  config.sign_out_via = :delete

  require 'omniauth/facebook'
  silence_warnings do
    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE if Rails.env.development? 
  end
  config.omniauth :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET']
end
