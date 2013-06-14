class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :teams, :through => :members
  has_many :members
  has_many :activities
  has_many :upvotes

  serialize :facebook_data, Hash

  def password_required?
    facebook_token.blank? && super
  end

  def team
    if teams.length == 0
      team = Team.new
      team.save(:validate => false)
      teams << team
      update_attribute(:admin, true)
    end
    
    teams.first
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def picture(type = nil)
    if type.present?
      "http://graph.facebook.com/#{facebook_id}/picture?type=#{type}"
    else
      "http://graph.facebook.com/#{facebook_id}/picture"
    end
  end

  def total_fundraiser
    activities.reduce(0){ |sum, activity| sum + activity.value }.round(2)
  end

  def feed
    team.feed.where(:user_id => self.id)
  end
end
