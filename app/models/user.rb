class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :teams, :through => :members
  has_many :members
  has_many :activities

  serialize :facebook_data, Hash

  def password_required?
    facebook_token.blank? && super
  end

  def team
    if teams.length == 0
      team = Team.new
      team.save(:validate => false)
      teams << team
    end
    
    teams.first
  end
end
