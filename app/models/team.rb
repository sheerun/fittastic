class Team < ActiveRecord::Base
  has_many :archived_fundraisers
  has_many :members
  has_many :users, :through => :members
  has_many :activities

  belongs_to :fundraiser

  validates :name, :presence => true
  validates :nip, :presence => true
  validates :budget,
    :presence => true,
    :numericality => { :only_integer => true, :greather_than => 0 }

  validate :check_nip

  def feed
    activities.order('id DESC')
  end

  def set_campaign!(campaign)
    unless campaign.nil?
      self.fundraiser = Fundraiser.new(:campaign => campaign)
      save!
    end
  end

  def token
    if self[:token].blank?
      update_attribute(:token, Devise.friendly_token[0,5])
    end

    self[:token]
  end

  def total_fundraiser
    activities.reduce(0){ |sum, activity| sum + activity.value }.round(2)
  end

  def best_users
    users.order('id DESC')
  end

  private
    def check_nip
      n = Nip.new(nip)
      errors[:nip] << 'Nieprawidłowy numer NIP' unless n.valid?
    end
end
