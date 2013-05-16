class ArchivedFundraiser < ActiveRecord::Base
  belongs_to :team
  belongs_to :campaign
end
