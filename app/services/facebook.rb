module Facebook extend self
  Error = Class.new(StandardError)
  DataError = Class.new(Error)

  # Raises FacebookDataError if provided data is incorrect
  #   the user called upen is unmodified in such case
  def user_from_facebook_data(data, user = nil)
    email = data["info"].fetch("email")
    token = data["credentials"].fetch("token")
    user = user || find_by_email_or_facebook_token(email, token) || User.new

    user.assign_attributes(
      :facebook_id => data.fetch("uid"),
      :facebook_token => token,
      :facebook_data => data.to_hash,
      :first_name => data["info"].fetch("first_name"),
      :last_name => data["info"].fetch("last_name"),
      :email => email,
      :password => Devise.friendly_token[0,20] 
    )

    user
  rescue IndexError
    raise Facebook::DataError.new
  end

  def find_by_email_or_facebook_token(email, token)
    User.where(:email => email).first || User.where(:facebook_token => token).first
  end
end
