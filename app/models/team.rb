class Team < ActiveRecord::Base
  has_many :archived_fundraisers
  has_many :members
  has_many :users, :through => :members

  belongs_to :campaign

  validates :name, :presence => true
  validates :nip, :presence => true
  validates :budget,
    :presence => true,
    :numericality => { :only_integer => true, :greather_than => 0 }

  validate :check_nip

  def set_campaign!(campaign)
    self.campaign = campaign
    save!
  end

  private
    def check_nip
      n = Nip.new(nip)
      errors[:nip] << 'Nieprawidłowy numer NIP' unless n.valid?
    end
end
